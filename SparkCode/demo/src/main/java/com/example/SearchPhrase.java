package com.example;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaPairRDD;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.Optional;
import java.util.Map;
import scala.Tuple2;

public class SearchPhrase {
    static String HOME="";
    static {
        Map<String, String>env = System.getenv();
        HOME = env.get("SPARK_APP");
    }

    public static JavaPairRDD<String,String> getInputRDDLineNumberWithText(JavaSparkContext sc){
        String inputFilePath = HOME + "/input";
        JavaPairRDD<String,String> linesWithFileName = sc.wholeTextFiles(inputFilePath).flatMapValues(lines -> {
            List<String> list = Arrays.asList(lines.split("\n"));
            return list.iterator();
        });
        JavaPairRDD<String,String> lineNumberWithText = linesWithFileName.mapToPair((Tuple2<String,String>tuple) -> {
            String fileName = tuple._1();
            fileName = fileName.substring(fileName.lastIndexOf("/")+1);
            String s = tuple._2();
            Tuple2<String,String> newTuple = new Tuple2<String,String>(fileName + " " + s.split("\t")[0].trim(),s.split("\t",2)[1].trim());
            return newTuple;
          });
          return lineNumberWithText;
    }
    public static void main(String args[]){
        SparkConf sparkConf = new SparkConf().setAppName("SearchPhrase").setMaster("local[2]").set("spark.executor.memory","2g");
        JavaSparkContext sc = new JavaSparkContext(sparkConf);
        String path = HOME + "/index";

        JavaRDD<String> indexFileRaw = sc.textFile(path);
        JavaPairRDD<String,String> indexFileRDD = indexFileRaw.mapToPair((s)->{
            s = s.substring(1, s.length()-1); //remove brackets()
            String key = s.split(",")[0];
            String value = s.split(",")[1];
            Tuple2<String,String> newTuple = new Tuple2<String,String>(key, value);
            return newTuple;
        });
        String searchPhrase = args[0];
        String[] searchWords = searchPhrase.split(" ");
        String searchClause = args[1];
        List<JavaPairRDD<String,String>>searchWordsRDD = new ArrayList<JavaPairRDD<String,String>>();
        for(int i=0;i<searchWords.length;i++){
            String searchWord = searchWords[i];
            JavaPairRDD<String,String> searchWordRDD = 
            indexFileRDD.filter((tuple)-> tuple._1().equals(searchWord))
            .mapToPair(tuple->{
                    String fileNameWithLineNumber = tuple._2().substring(0,tuple._2().lastIndexOf(" "));
                    String position = tuple._2.substring(tuple._2().lastIndexOf(" ")+1);
                    return new Tuple2<String,String>(fileNameWithLineNumber,position);
                })
            .reduceByKey((s1,s2)->{
                return s1.concat(" " +s2);
            });
            searchWordsRDD.add(searchWordRDD);
        }
        JavaPairRDD<String,String> searchPhraseRDD = searchWordsRDD.get(0);
        if(searchClause.equalsIgnoreCase("and")){
            for(int i=1;i<searchWordsRDD.size();i++){
                searchPhraseRDD = 
                    searchPhraseRDD
                    .join(searchWordsRDD.get(i))
                    .mapToPair(tuple->{
                        Tuple2<String,String> positions = tuple._2();
                        String finalPosition = positions._1 +" "+positions._2;
                        return new Tuple2<String,String>(tuple._1,finalPosition);
                    });  
            }
        }
        else {
            for(int i=1;i<searchWordsRDD.size();i++){
                searchPhraseRDD = 
                    searchPhraseRDD
                    .fullOuterJoin(searchWordsRDD.get(i))
                    .mapToPair(tuple->{
                        Tuple2<Optional<String>,Optional<String>> positions = tuple._2;
                        String finalPosition;
                        if(positions._1.isPresent()&&positions._2().isPresent())
                            finalPosition = positions._1.get() +" "+positions._2.get();
                        else if(positions._1().isPresent())
                            finalPosition = positions._1.get();
                        else 
                            finalPosition = positions._2.get();
                        return new Tuple2<String,String>(tuple._1,finalPosition);
                    });  
            }
        }
        JavaPairRDD<String,String> lineNumberWithText = getInputRDDLineNumberWithText(sc);
        JavaPairRDD<String,Tuple2<String,String>> searchPhraseWithTextRDD =
                lineNumberWithText.join(searchPhraseRDD);
        searchPhraseWithTextRDD.saveAsTextFile(HOME+"/searchPhrase");
        sc.close();
    }
    
}
