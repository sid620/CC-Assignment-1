import java.io.IOException;
// import java.lang.*;
import java.util.StringTokenizer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

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
public class SearchPhrase {

  /*
  This is the Mapper class. It extends the hadoop's Mapper class.
  This maps input key/value pairs to a set of intermediate(output) key/value pairs.
  Here our input key is a Object and input value is a Text.
  And the output key is a Text and value is an Text. [word<Text> DocID<Text>]<->[aspect 5722018411]
  */
  
  public static class SearchPhraseMapper
       extends Mapper<Object, Text, Text, Text>{

    /*
    Hadoop supported datatypes. This is a hadoop specific datatype that is used to handle
    numbers and Strings in a hadoop environment. IntWritable and Text are used instead of
    Java's Integer and String datatypes.
    Here 'one' is the number of occurance of the 'word' and is set to value 1 during the
    Map process.
    */
    //private final static IntWritable one = new IntWritable(1);
    private Text word = new Text();
    
    private static HashSet<String> getPhraseSet(String phraseWords){
      StringTokenizer phraseWordsTokenizer = new StringTokenizer(phraseWords," ");
      HashSet<String> phraseSet = new HashSet<String>();

      while(phraseWordsTokenizer.hasMoreTokens()){
        String phraseWord = phraseWordsTokenizer.nextToken();
        phraseSet.add(phraseWord);
      }
      return phraseSet;
    }

    public void map(Object key, Text value, Context context) throws IOException, InterruptedException {
      Configuration conf = context.getConfiguration();
      String phraseWordsArg = conf.get("phraseWords");

      HashSet<String> phraseSet = getPhraseSet(phraseWordsArg);

      String line = value.toString();
      int separator = line.indexOf('\t');
      if(separator==-1) return;
      String word = line.substring(0,separator).trim();
      if(!phraseSet.contains(word)){
        return;
      }
      String positionString = line.substring(separator).trim();
      StringTokenizer positionTokenizer = new StringTokenizer(positionString, " ");
      String filename = positionTokenizer.nextToken();
      String linenumber = positionTokenizer.nextToken();
      String position = positionTokenizer.nextToken();
      context.write(new Text(filename + " "+linenumber), new Text(position+ " "+ word));
      }
    }


  public static class SearchPhraseReducer
       extends Reducer<Text,Text,Text,Text> {
    /*
    Reduce method collects the output of the Mapper calculate and aggregate the word's count.
    */
    private static HashSet<String> getPhraseSet(String phraseWords){
      StringTokenizer phraseWordsTokenizer = new StringTokenizer(phraseWords," ");
      HashSet<String> phraseSet = new HashSet<String>();

      while(phraseWordsTokenizer.hasMoreTokens()){
        String phraseWord = phraseWordsTokenizer.nextToken();
        phraseSet.add(phraseWord);
      }
      return phraseSet;
    }

    public void reduce(Text key, Iterable<Text> values,Context context) throws IOException, InterruptedException {

      /*
      Iterate through all the values available with a key [word] and concatenate them together with the separator as \t and give the
      final result as the key and concatenation of its values
      */
      Configuration conf = context.getConfiguration();
      String phraseWordsArg = conf.get("phraseWords");
      String clause = conf.get("clause");
      HashSet<String> phraseSet = getPhraseSet(phraseWordsArg);

      String ConcatenatedPositions = "";
      
      if(clause.equalsIgnoreCase("AND")){
        HashSet<String> WordSetForTheLine = new HashSet<String>();
        for(Text val: values){
          String value = val.toString();
          int spaceIndex = value.indexOf(" ");
          String position = value.substring(0,spaceIndex).trim();
          String word = value.substring(spaceIndex).trim();
          WordSetForTheLine.add(word);
          ConcatenatedPositions = ConcatenatedPositions.concat(value+" ");
        }
        if(WordSetForTheLine.equals(phraseSet)){
          context.write(key,new Text(ConcatenatedPositions.trim()));
        }
      }

      if(clause.equalsIgnoreCase("OR")){
        for(Text val: values){
          String value = val.toString();
          // int spaceIndex = value.indexOf(" ");
          // String position = value.substring(0,spaceIndex).trim();
          // String word = value.substring(spaceIndex).trim();
          ConcatenatedPositions = ConcatenatedPositions.concat(value+" ");
        }
        context.write(key,new Text(ConcatenatedPositions.trim()));
      }
    }
    }

  public static void main(String[] args) throws Exception {
    Configuration conf = new Configuration();
    conf.set("phraseWords", args[2]);
    conf.set("clause", args[3]);
    Job job = Job.getInstance(conf, "search phrase");
    job.setJarByClass(SearchPhrase.class);
    job.setMapperClass(SearchPhraseMapper.class);
    // Commend out this part if you want to use combiner. Mapper and Reducer input and outputs type matching might be needed in this case. 
    //job.setCombinerClass(SearchPhrase.class);
    job.setReducerClass(SearchPhraseReducer.class);
    job.setOutputKeyClass(Text.class);
    job.setOutputValueClass(Text.class);
    FileInputFormat.addInputPath(job, new Path(args[0]));
    FileOutputFormat.setOutputPath(job, new Path(args[1]));
    System.exit(job.waitForCompletion(true) ? 0 : 1);
  }
}
