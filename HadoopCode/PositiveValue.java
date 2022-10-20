import java.io.IOException;
// import java.lang.*;
import java.util.StringTokenizer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.JobContext;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.input.FileSplit;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;

public class PositiveValue {

  public static class PositiveValueMapper
      extends Mapper<Object, Text, Text, IntWritable> {

    private Text word = new Text();

    private static HashSet<String> getPositiveWordSet(String positiveWords) {
      StringTokenizer positiveWordsTokenizer = new StringTokenizer(positiveWords, " ");
      HashSet<String> positiveWordSet = new HashSet<String>();

      while (positiveWordsTokenizer.hasMoreTokens()) {
        String positiveWord = positiveWordsTokenizer.nextToken();
        positiveWordSet.add(positiveWord);
      }
      return positiveWordSet;
    }

    public void map(Object key, Text value, Context context) throws IOException, InterruptedException {
      Configuration conf = context.getConfiguration();
      String positiveWordsArg = conf.get("positiveWords");

      HashSet<String> positiveWordSet = getPositiveWordSet(positiveWordsArg);

      String line = value.toString();
      int separator = line.indexOf('\t');
      if (separator == -1)
        return;
      String word = line.substring(0, separator).trim();
      if (!positiveWordSet.contains(word)) {
        return;
      }
      String positionString = line.substring(separator).trim();
      StringTokenizer positionTokenizer = new StringTokenizer(positionString, " ");
      String filename = positionTokenizer.nextToken();
      context.write(new Text(filename), new IntWritable(1));
    }
  }

  public static class PositiveValueReducer
      extends Reducer<Text, IntWritable, Text, IntWritable> {
    public void reduce(Text key, Iterable<IntWritable> values, Context context)
        throws IOException, InterruptedException {

      int sum = 0;
      for (IntWritable val : values) {
        sum += val.get();
      }
      context.write(key, new IntWritable(sum));
    }
  }

  public static void main(String[] args) throws Exception {
    Configuration conf = new Configuration();
    conf.set("positiveWords", args[2]);
    Job job = Job.getInstance(conf, "positive Value");
    job.setJarByClass(PositiveValue.class);
    job.setMapperClass(PositiveValueMapper.class);
    job.setReducerClass(PositiveValueReducer.class);
    job.setOutputKeyClass(Text.class);
    job.setOutputValueClass(IntWritable.class);
    FileInputFormat.addInputPath(job, new Path(args[0]));
    FileOutputFormat.setOutputPath(job, new Path(args[1]));
    System.exit(job.waitForCompletion(true) ? 0 : 1);
  }
}
