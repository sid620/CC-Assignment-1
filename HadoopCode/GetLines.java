import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
// import java.lang.*;
import java.util.StringTokenizer;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
//import org.apache.hadoop.mapreduce.MapContext;
import org.apache.hadoop.mapreduce.JobContext;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.input.FileSplit;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.io.IOUtils;
import org.apache.hadoop.fs.FSDataInputStream;

public class GetLines {

  public static class GetLinesMapper extends Mapper<Object, Text, Text, Text> {
    private Text word = new Text();
    private static String lineSeparator = "\t";

    private static int getLineNumber(String line) {
      int separator = line.indexOf(lineSeparator);
      if (separator == -1)
        return -1;
      int lineNumber = Integer.parseInt(line.substring(0, separator).trim());
      return lineNumber;
    }

    private static String getText(String line) {
      int separator = line.indexOf(lineSeparator);
      String text = line.substring(separator).trim();
      return text;
    }

    public void map(Object key, Text value, Context context) throws IOException, InterruptedException {
      String fileName = ((FileSplit) context.getInputSplit()).getPath().getName();
      String line = value.toString();

      int lineNumber = getLineNumber(line);
      if (lineNumber == -1)
        return;
      String text = getText(line);

      String searchQuery = fileName + " " + lineNumber;
      Configuration conf = context.getConfiguration();
      String positions = conf.get("Positions");
      int pos = positions.indexOf(searchQuery);
      if (pos == -1)
        return;
      String searchQueryHead = positions.substring(pos);
      StringTokenizer tokenizer = new StringTokenizer(searchQueryHead, " \t\n");
      String finalKey = tokenizer.nextToken(); // filename
      String lineNumberPos = tokenizer.nextToken();
      int lineNumberPosInt = Integer.parseInt(lineNumberPos);
      finalKey = finalKey + " " + lineNumberPos; // lineNumber
      finalKey = finalKey + " " + tokenizer.nextToken(); // positionNumber
      if (lineNumber == lineNumberPosInt) // to disallow prefixes such as filename 7 will come if positions have
                                          // filename 74
        context.write(new Text(finalKey), new Text(text));
    }

  }

  public static class GetLinesReducer extends Reducer<Text, Text, Text, Text> {
    public void reduce(Text key, Iterable<Text> values, Context context) throws IOException, InterruptedException {
      StringBuilder IndexValueList = new StringBuilder();
      for (Text val : values) {
        IndexValueList.append(val);
      }
      context.write(key, new Text(IndexValueList.toString()));
    }
  }

  public static String readPositions(String positionFilePath, FileSystem fs) throws IOException{
    Path path = new Path(positionFilePath);
    FileStatus[] status = fs.listStatus(path);
    String fileContents = "";
    for(int i=0; i<status.length;i++){
      String filePath = status[i].getPath().toString();
      if(filePath.contains("part")){
        System.out.println("filePath "+ filePath);
        FSDataInputStream in = fs.open(status[i].getPath());
        ByteBuffer buffer = ByteBuffer.allocate(4096);
        while(in.read(buffer)!=-1){
          byte[] bufferByteArray = buffer.array();
          String currentStr = new String(bufferByteArray);
          fileContents = fileContents + currentStr;
        }
        
      }
    }
    String positions = fileContents.substring(fileContents.indexOf("\t")+1).trim();
    return positions;
  }
  public static void main(String[] args) throws Exception {
    Configuration conf = new Configuration();
    String positionString = "";
    FileSystem fs = FileSystem.get(conf);
    try{
    positionString = readPositions(args[2],fs);
    } catch(IOException ex){
      System.out.print(ex);
    }

    conf.set("Positions", positionString);
    Job job = Job.getInstance(conf, "search word");
    job.setJarByClass(GetLines.class);
    job.setMapperClass(GetLinesMapper.class);
    job.setReducerClass(GetLinesReducer.class);
    job.setOutputKeyClass(Text.class);
    job.setOutputValueClass(Text.class);
    FileInputFormat.addInputPath(job, new Path(args[0]));
    FileOutputFormat.setOutputPath(job, new Path(args[1]));
    System.exit(job.waitForCompletion(true) ? 0 : 1);
  }
}