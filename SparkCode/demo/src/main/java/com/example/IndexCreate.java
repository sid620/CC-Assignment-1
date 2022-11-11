package com.example;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.StringTokenizer;
import java.util.Map;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaPairRDD;
import org.apache.spark.api.java.JavaSparkContext;

import scala.Tuple2;

public class IndexCreate {
//  static String HOME = "/home/tushar/Downloads/SparkAssignment1";

  public static void main(String[] args) {
    SparkConf sparkConf = new SparkConf().setAppName("IndexCreate").setMaster("local[2]").set("spark.executor.memory","2g");
    JavaSparkContext sc = new JavaSparkContext(sparkConf);
    Map <String, String> env = System.getenv();
    String HOME = env.get("SPARK_APP");
    String path = HOME+ "/input";
    JavaPairRDD<String,String> linesWithFileName = sc.wholeTextFiles(path).flatMapValues(lines -> {
      List<String> list = Arrays.asList(lines.split("\n"));
      return list.iterator();
    });

    //separated lineNumber with the text
    //made a key value pair <Filename LineNumber, Text>
    JavaPairRDD<String,String> lineNumberWithText = linesWithFileName.mapToPair((Tuple2<String,String>tuple) -> {
      String fileName = tuple._1();
      fileName = fileName.substring(fileName.lastIndexOf("/")+1);
      String s = tuple._2();
      Tuple2<String,String> newTuple = new Tuple2<String,String>(fileName + " " + s.split("\t")[0].trim(),s.split("\t",2)[1].trim());
      return newTuple;
    });
    JavaPairRDD <String,String> lineNumberWithTextAndPos = 
    lineNumberWithText.flatMapValues((v) -> {
      StringTokenizer tokenizer = new StringTokenizer(v," \t\n");
      List<String> wordsArray = new ArrayList<String>();
      int position =1;
      while(tokenizer.hasMoreTokens()){
        String word = tokenizer.nextToken();
        word = word.replaceAll("[^a-zA-Z]", "").trim().toLowerCase();
        if(word.equals("")) continue;
        String listElement = word+"\t"+position;
        position++;
        wordsArray.add(listElement);
      }
      return wordsArray.iterator();
    });
    JavaPairRDD <String,String> wordWithPosition = lineNumberWithTextAndPos.mapToPair((tuple) -> {
      String k = tuple._1;
      String v = tuple._2;
      String word = v.split("\t")[0];
      String position = v.split("\t")[1];
      String newValue = k + " "+position;
      Tuple2<String,String> newTuple = new Tuple2<String,String>(word,newValue);
      return newTuple; 
    });
    wordWithPosition.saveAsTextFile(HOME+"/index");
    sc.close();
  }
} 