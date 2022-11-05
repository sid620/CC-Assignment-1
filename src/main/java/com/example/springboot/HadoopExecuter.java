package com.example.springboot;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.MessageFormat;
import java.util.List;

public class HadoopExecuter {
    private final String hadoopLoc;
    private final String jarLoc;
    private final String className;
    private final String inputLoc;
    private final String outputLoc;

    // Output Variables
    private List<String> hadoop_output;
    private long execution_ms;

    public HadoopExecuter(String jarLoc, String className, String inputLoc, String outputLoc) {
        this.hadoopLoc = PropertiesCache.getInstance().getProperty("hadoopLocation");
        this.jarLoc = jarLoc;
        this.className = className;
        this.inputLoc = inputLoc;
        this.outputLoc = outputLoc;
    }

    public void execute() throws IOException {
        // Execute command
        String command = MessageFormat.format(
                "{0} jar {1} {2} {3} {4}",
                (Object) new String[]
                {
                    this.hadoopLoc,
                    this.jarLoc,
                    this.className,
                    this.inputLoc,
                    this.outputLoc
                });
        long startTime = System.currentTimeMillis();
        var hadoop_process = Runtime.getRuntime().exec(command);
        long endTime = System.currentTimeMillis();

        // Read the output
        var reader = new BufferedReader(new InputStreamReader(hadoop_process.getInputStream()));
        hadoop_output = reader.lines().toList();
        execution_ms = endTime - startTime;
    }

    public long getExecutionTime() {
        assert hadoop_output != null;
        return execution_ms;
    }
}