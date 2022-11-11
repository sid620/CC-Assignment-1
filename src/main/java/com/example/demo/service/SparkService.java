package com.example.demo.service;

import com.example.demo.models.PhraseResponse;
import com.example.demo.models.WordResponse;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.time.Duration;
import java.time.Instant;
import java.time.temporal.Temporal;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

@Service
public class SparkService {

    public enum PhraseInputType
    {
        AND,
        OR
    }
    public long buildIndex(){
        ProcessBuilder builder = new ProcessBuilder("sh","-c","cd SparkCode/demo && ${SPARK_HOME}/bin/spark-submit --class \"com.example.IndexCreate\" --master local[4] target/demo-1.0.0.jar");
        Temporal d1 = Instant.now();
//        builder.command("cd SparkCode/demo");
        try {
//            System.out.println("successful");
            Process process = builder.start();
            process.waitFor();
        } catch (IOException | InterruptedException e) {
            System.out.println("Error");
            throw new RuntimeException(e);
        }
        Temporal d2 = Instant.now();
        return Duration.between(d1,d2).toMillis();
    }
    public WordResponse search_word(String word)
    {
        ProcessBuilder builder  = new ProcessBuilder("sh","-c","cd SparkCode/demo && ${SPARK_HOME}/bin/spark-submit --class \"com.example.SearchWord\" --master local[4] target/demo-1.0.0.jar \""+word+"\"");
        try {
//            System.out.println("successful");
            Process process = builder.start();
            process.waitFor();
        } catch (IOException | InterruptedException e) {
            System.out.println("Error");
            throw new RuntimeException(e);
        }
        //read output files in searchWord directory
        File folder = new File("/usr/src/SparkApp/SparkCode/searchWord");
        String input, lineText, fileName;
        int lineNo, linePos;
        WordResponse.WordEntry wordEntry;
        WordResponse wordResponse = new WordResponse();
        for(File entry: folder.listFiles()){
            if(entry.getName().contains("part")){
                try {
                    Scanner reader = new Scanner(entry);
                    while(reader.hasNextLine()){
                        input = reader.nextLine();
                        //populate wordEntry
                        /*Use regex groups to extract elements*/
                        Pattern fileNamePattern = Pattern.compile("(\\()(.*\\.txt).([0-9]+),\\((.*),([0-9]*)");
                        Matcher fileNameMatcher = fileNamePattern.matcher(input);
                        if(fileNameMatcher.find()){
                            fileName =fileNameMatcher.group(2);
                            lineNo = Integer.parseInt(fileNameMatcher.group(3));
                            lineText = fileNameMatcher.group(4);
                            linePos = Integer.parseInt(fileNameMatcher.group(5));
                            wordEntry = new WordResponse.WordEntry(lineNo,linePos,lineText);
                            wordResponse.AddEntry(fileName,wordEntry);
                        }
                    }
                    reader.close();

                } catch (FileNotFoundException e) {
                    System.out.println("File not found");
                    throw new RuntimeException(e);
                }

            }
        }
        ProcessBuilder terminate = new ProcessBuilder("sh","-c","cd SparkCode && rm -rf searchWord");
        try {
            Process terminateProcess = terminate.start();
            terminateProcess.waitFor();
        } catch (IOException | InterruptedException e) {
            throw new RuntimeException(e);
        }
        //erase output files in searchWord
        //return response
        return wordResponse;
    }
    public Map<String, Long> positive_check(){
        ProcessBuilder builder = new ProcessBuilder("sh","-c","cd SparkCode/demo && ${SPARK_HOME}/bin/spark-submit --class \"com.example.PositiveValue\" --master local[4] target/demo-1.0.0.jar");
        try {
            Process process = builder.start();
            process.waitFor();
        } catch (IOException | InterruptedException e) {
            throw new RuntimeException(e);
        }
        HashMap<String,Long>response=new HashMap<String, Long>();
        File folder = new File("/usr/src/SparkApp/SparkCode/positiveValue");
        String input, fileName;
        Long positivity;
        for(File entry:folder.listFiles()){
            if(entry.getName().contains("part")){
                try {
                    Scanner reader = new Scanner(entry);
                    while(reader.hasNextLine()){
                        input = reader.nextLine();
                        Pattern posPattern = Pattern.compile("\\((.*),([0-9]*)\\)");
                        Matcher posMatcher =posPattern.matcher(input);
                        if(posMatcher.find()){
                            response.put(posMatcher.group(1),Long.parseLong(posMatcher.group(2)));
                        }
                    }
                    reader.close();
                } catch (FileNotFoundException e) {
                    throw new RuntimeException(e);
                }
            }
        }
        //erase output files in positiveValue
        ProcessBuilder terminate = new ProcessBuilder("sh","-c","cd SparkCode && rm -rf positiveValue");
        try {
            Process terminateProcess = terminate.start();
            terminateProcess.waitFor();
        } catch (IOException | InterruptedException e) {
            throw new RuntimeException(e);
        }
        return response;
    }
    public PhraseResponse search_phrase(PhraseInputType pit, List<String> words)
    {
        PhraseResponse response = new PhraseResponse();
        String phraseQuery = String.join(" ",words);
        String type = pit.name().toLowerCase();
        ProcessBuilder builder = new ProcessBuilder("sh","-c","cd SparkCode/demo && ${SPARK_HOME}/bin/spark-submit --class \"com.example.SearchPhrase\" --master local[4] target/demo-1.0.0.jar \""+phraseQuery+"\" \""+type+"\"");
        try {
            Process process = builder.start();
            process.waitFor();
        } catch (IOException | InterruptedException e) {
            throw new RuntimeException(e);
        }
        /*read output values*/
        File folder = new File("/usr/src/SparkApp/SparkCode/searchPhrase");
        for(File entry:folder.listFiles()) {
            if(entry.getName().contains("part")) {
                try {
                    Scanner reader = new Scanner(entry);
                    String input, fileName, lineText;
                    List<Integer> linePosition;
                    int lineNo;
                    while (reader.hasNextLine()) {
                        input = reader.nextLine();
                        Pattern phraseOutputPattern = Pattern.compile("\\((.*\\.txt).([0-9]*),\\((.*),(.*)\\)\\)");
                        Matcher phraseOutputMatcher = phraseOutputPattern.matcher(input);
                        if (phraseOutputMatcher.find()) {
                            fileName = phraseOutputMatcher.group(1);
                            lineNo = Integer.parseInt(phraseOutputMatcher.group(2));
                            lineText = phraseOutputMatcher.group(3);
                            linePosition = Arrays.stream(phraseOutputMatcher.group(4).split(" ")).map(Integer::valueOf).collect(Collectors.toList());
                            response.AddEntry(fileName, new PhraseResponse.PhraseEntry(lineNo, linePosition, lineText));
                        }
                    }
                    reader.close();

                } catch (FileNotFoundException e) {
                    throw new RuntimeException(e);
                }
            }
        }
        /*delete searchPhrase directory*/
        ProcessBuilder terminate = new ProcessBuilder("sh","-c","cd SparkCode && rm -rf searchPhrase");
        try {
            Process terminateProcess = terminate.start();
            terminateProcess.waitFor();
        } catch (IOException | InterruptedException e) {
            throw new RuntimeException(e);
        }
        return response;
    }
}
