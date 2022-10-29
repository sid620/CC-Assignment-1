package com.example;

import java.util.Arrays;
import java.util.List;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaPairRDD;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;

import scala.Tuple2;

public class SearchWord {
    static String HOME = "/home/tushar/Downloads/SparkAssignment1";

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
        SparkConf sparkConf = new SparkConf().setAppName("SearchWord").setMaster("local[2]").set("spark.executor.memory","2g");
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
        String searchWord = args[0];
        System.out.println(searchWord);
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
        JavaPairRDD<String,String> lineNumberWithText = getInputRDDLineNumberWithText(sc);
        JavaPairRDD<String,Tuple2<String,String>> searchWordWithTextRDD =
                lineNumberWithText.join(searchWordRDD);
        searchWordWithTextRDD.saveAsTextFile(HOME+"/searchWord");
        sc.close();
    }
    
}
