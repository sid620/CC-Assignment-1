package com.example;

import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaPairRDD;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;

import scala.Tuple2;

public class PositiveValue {
    static String HOME = "/home/tushar/Downloads/SparkAssignment1";

    public static void main(String args[]){
        SparkConf sparkConf = new SparkConf().setAppName("PositiveValue").setMaster("local[2]").set("spark.executor.memory","2g");
        JavaSparkContext sc = new JavaSparkContext(sparkConf);
        String path = HOME + "/index";

        JavaRDD<String> indexFileRaw = sc.textFile(path);
        JavaPairRDD<String,String> indexFileRDD = indexFileRaw.mapToPair((s)->{
            s = s.substring(1, s.length()-1); //remove brackets()
            String key = s.split(",")[0];
            String value = s.split(",")[1].split(" ")[0]; //only filename
            Tuple2<String,String> newTuple = new Tuple2<String,String>(key, value);
            return newTuple;
        });
        String positiveWordsFilePath = HOME+"/positive words.csv";
        JavaRDD<String> positiveWords = sc.textFile(positiveWordsFilePath)
                                        .map(s->s.split(",")[1]);
        JavaPairRDD<String,Integer> positiveWordRDD = positiveWords.mapToPair(s->new Tuple2<String,Integer>(s,1));
        JavaPairRDD<String,Integer> positiveValueRdd = indexFileRDD
                                                    .join(positiveWordRDD)
                                                    .values()
                                                    .mapToPair(tuple->new Tuple2<String,Integer>(tuple._1(),tuple._2()))
                                                    .reduceByKey((v1,v2)->v1+v2);
        positiveValueRdd.saveAsTextFile(HOME+"/positiveValue");
        sc.close();
    }
    
}
