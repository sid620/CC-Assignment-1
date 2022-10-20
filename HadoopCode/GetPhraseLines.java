import java.io.IOException;
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

public class GetPhraseLines {

  public static class GetPhraseLinesMapper
      extends Mapper<Object, Text, Text, Text> {
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

      // Make the SearchQuery
      String searchQuery = fileName + " " + lineNumber;

      // GET Positions from the context for whom lines need to be fetched
      Configuration conf = context.getConfiguration();
      String positions = conf.get("Positions");
      int pos = positions.indexOf(searchQuery);
      if (pos == -1)
        return;

      // Find the queryString in the Positions String
      String searchQueryHead = positions.substring(pos);

      // Get the String for that matched filenumber and lineNumber
      StringTokenizer tokenizer = new StringTokenizer(searchQueryHead, "\n");
      String PositionString = tokenizer.nextToken();

      // Separate FileName And LineNumber
      StringTokenizer positionTokenizerItr = new StringTokenizer(PositionString, " \t");
      String finalKey = positionTokenizerItr.nextToken(); // filename
      String lineNumberPos = positionTokenizerItr.nextToken();
      int lineNumberPosInt = Integer.parseInt(lineNumberPos);
      finalKey = finalKey + " " + lineNumberPos; // lineNumber
      while (positionTokenizerItr.hasMoreTokens())
        finalKey = finalKey + " " + positionTokenizerItr.nextToken(); // positionNumber
      if (lineNumber == lineNumberPosInt) // to disallow prefixes such as filename 7 will come if positions have
                                          // filename 74
        context.write(new Text(finalKey), new Text(text));
    }

  }

  public static class GetPhraseLinesReducer extends Reducer<Text, Text, Text, Text> {
    public void reduce(Text key, Iterable<Text> values, Context context) throws IOException, InterruptedException {
      StringBuilder IndexValueList = new StringBuilder();
      for (Text val : values) {
        IndexValueList.append(val);
      }
      context.write(key, new Text(IndexValueList.toString()));
    }
  }

  public static void main(String[] args) throws Exception {
    Configuration conf = new Configuration();
    String Positions = args[2];
    Positions = Positions.replace("\\t", "\t");
    Positions = Positions.replace("\\n", "\n");
    conf.set("Positions", Positions);
    Job job = Job.getInstance(conf, "get phrase lines");
    job.setJarByClass(GetPhraseLines.class);
    job.setMapperClass(GetPhraseLinesMapper.class);
    job.setReducerClass(GetPhraseLinesReducer.class);
    job.setOutputKeyClass(Text.class);
    job.setOutputValueClass(Text.class);
    FileInputFormat.addInputPath(job, new Path(args[0]));
    FileOutputFormat.setOutputPath(job, new Path(args[1]));
    System.exit(job.waitForCompletion(true) ? 0 : 1);
  }
}
