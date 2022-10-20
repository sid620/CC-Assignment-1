import java.io.IOException;
// import java.lang.*;
import java.util.StringTokenizer;
import java.util.HashMap;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
//import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
//import org.apache.hadoop.mapreduce.MapContext;
import org.apache.hadoop.mapreduce.JobContext;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.input.FileSplit;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;

public class InvertedIndex {

  public static class TokenizerMapper
      extends Mapper<Object, Text, Text, Text> {

    private Text word = new Text();

    public void map(Object key, Text value, Context context) throws IOException, InterruptedException {

      String fileName = ((FileSplit) context.getInputSplit()).getPath().getName();
      String line = value.toString();
      int separator = line.indexOf('\t');
      if (separator == -1)
        return;
      int lineNumber = Integer.parseInt(line.substring(0, separator).trim());
      String text = line.substring(separator).toLowerCase();

      // Reading input one line at a time and tokenizing by using space as tokenizer.
      StringTokenizer itr = new StringTokenizer(text, " ");
      int positionNumber = 1;
      // Iterating through all the words available in that line and forming the
      // key/value pair.
      while (itr.hasMoreTokens()) {
        String nextWord = itr.nextToken();
        // Remove special characters and convert case to lower for all words
        word.set(nextWord.replaceAll("[^a-zA-Z]", ""));
        if (word.toString() != "" && !word.toString().isEmpty()) {
          String Location = fileName + " " + lineNumber + " " + positionNumber;
          context.write(word, new Text(Location));
          positionNumber++;
        }
      }
    }
  }

  public static class IndexReducer
      extends Reducer<Text, Text, Text, Text> {
    public void reduce(Text key, Iterable<Text> values,
        Context context) throws IOException, InterruptedException {

      StringBuilder IndexValueList = new StringBuilder();
      for (Text val : values)
        context.write(key, val);

      // IndexValueList.append(val + "\t");

      // IndexValueList.append("\n");
      // context.write(key, new Text(IndexValueList.toString()));
    }
  }

  public static void main(String[] args) throws Exception {
    Configuration conf = new Configuration();
    Job job = Job.getInstance(conf, "inverted index");
    job.setJarByClass(InvertedIndex.class);
    job.setMapperClass(TokenizerMapper.class);
    job.setReducerClass(IndexReducer.class);
    job.setOutputKeyClass(Text.class);
    job.setOutputValueClass(Text.class);
    FileInputFormat.addInputPath(job, new Path(args[0]));
    FileOutputFormat.setOutputPath(job, new Path(args[1]));
    System.exit(job.waitForCompletion(true) ? 0 : 1);
  }
}
