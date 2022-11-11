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

public class SearchWord {

  public static class SearchWordMapper
      extends Mapper<Object, Text, Text, Text> {

    private Text word = new Text();

    public void map(Object key, Text value, Context context) throws IOException, InterruptedException {

      Configuration conf = context.getConfiguration();
      String queryWord = conf.get("queryWord");
      queryWord = queryWord.toLowerCase();
      String line = value.toString();
      int separator = line.indexOf('\t');
      if (separator == -1)
        return;
      String word = line.substring(0, separator).trim();
      if (!queryWord.equals(word)) {
        return;
      }
      String positions = line.substring(separator).trim();

      context.write(new Text(queryWord), new Text(positions));
    }
  }

  public static class SearchWordReducer extends Reducer<Text, Text, Text, Text> {
    public void reduce(Text key, Iterable<Text> values, Context context) throws IOException, InterruptedException {
      String allPositions = "";
      for (Text val : values) {
        String valString = val.toString();
        allPositions = allPositions.concat(valString);
        allPositions = allPositions.concat(" ");
      }

      context.write(key, new Text(allPositions));
    }
  }

  public static void main(String[] args) throws Exception {
    Configuration conf = new Configuration();
    conf.set("queryWord", args[2]);
    Job job = Job.getInstance(conf, "search word");
    job.setJarByClass(SearchWord.class);
    job.setMapperClass(SearchWordMapper.class);
    job.setReducerClass(SearchWordReducer.class);
    job.setOutputKeyClass(Text.class);
    job.setOutputValueClass(Text.class);
    FileInputFormat.addInputPath(job, new Path(args[0]));
    FileOutputFormat.setOutputPath(job, new Path(args[1]));
    System.exit(job.waitForCompletion(true) ? 0 : 1);
  }
}
