1. Introduction
We have built three different microservices as a part of this assignment:
- REST Server - This is the main server that acts as an interface to all the services with the client. It exposes various rest api and calls the appropriate service, gets the results and sends them back to the client.
- Hadoop - This service uses Hadoop Map Reduce Architecture in order to perform and get different results on the given database like index building, searching a word, searching a phrase and getting postive values.
- Spark -  This service tries to perform and get similar results but uses Spark instead.

2. Internal Working
   1. REST Server
   ***
   2. Hadoop Service
      1. The basic command to run any task on Hadoop is of the following format
        ```
            hadoop jar {AbsoluteJarPath} {NameofClassContainingMain} {AbsoluteInputDirectoryPath} {AbsoluteOutputDirectoryPath} {MoreArgumentsIfRequired}
        ```
        - AbsoluteJarPath - Jar File for that task that you want to perform ( eg. index building, searching a word, etc)
        - NameOfClassContainingMain - This is the class name which contains your main function. Usually the same as the jar file name.
        - AbsoluteInputDirectory Path - This directory contains all the input files for the task.
        - AbsoluteOutputDirectoryPath - This directory is created by the code. This has all the output files.
        1. Building an Index
           1. Jar File - `InvertedIndex.jar`
           2. ClassName - `InvertedIndex`
           3. InputDirectory - This directory contains all the input files in the database with a line number appended to each line in the beginning
           4. Output Directory - This directory is created by the code. A file is generated named as "part-r-00000" among other files which has the generated Index \
            This creates an index file for the database files. The index file consists of various entries.\
            Each entry of the form \
            **{word}TAB{filename}SPACE{linenumber}SPACE{positionNumber}**
        2. Search a Word
            - Two Processes will have to be run one after the other.\
            The first process searches the word using the index file.\
            The second process will generate the final output by using the output of the previous process.
            - First Process 
              1. Jar File - `SearchWord.jar`
              2. ClassName - `SearchWord`
              3. InputDirectory - This directory contains the index file created with index build
              4. Output Directory - This directory is created by the code. A file is generated named as "part-r-00000" among other files which has the word and the filenumbers,lineNumbers and positionNumbers\
               Each entry of the form\
               **{word}TAB{filenumber1}SPACE{linenumber1}SPACE{positionNumber1}SPACE{filenumber2}SPACE{linenumber2}SPACE{positionNumber2}... so on**
              5. Search Word (args[2]) - The word that needs to be searched in all the files 
            - Second Process
               1. Jar File - `GetLines.jar`
               2. ClassName -`GetLines`
               3. InputDirectory - Directory containing the database files
               4. Output Directory - This directory is created by the code. A file is generated named as "part-r-00000" among other files which has the word and the filenumbers,lineNumbers and positionNumbers ALONG WITH THE TEXT for that line.
               5. PositionString (args[2]) - This contains the position string for that word obtained from the previous file. The server will read the file generated in previous step in a single String and will truncate the {word} and TAB. The rest of the string is passed as a single argument as the third argument to this jar
         1. Search a Phrase 
            - Two Processes will have to be run one after the other.\
            The first process searches the phrase using the index file.\
            The second process will generate the final output by using the output of the previous process.
            - First Process 
              1. Jar File - `SearchPhrase.jar`
              2. ClassName - `SearchPhrase`
              3. InputDirectory - This directory contains the index file created with index build
              4. Output Directory - This directory is created by the code. A file is generated named as "part-r-00000" among other files which has the filenumbers,lineNumbers and positionNumbers along with the words of the phrases found.
               Each entry of the form\
               **{filenumber}SPACE{linenumber}TAB{positionNumber1}SPACE{wordAtPositionNumber1}SPACE{positionNumber2}SPACE{wordAtPositionNumber2}... so on and NEWLINE_CHARACTER IN THE END**
              5. Search Phrase (args[3]) - Single space separated string containing all the words in a phrase
              6. Search Clause(args[4]) - String EITHER "and" OR "or". Self Explanatory
            - Second Process
               1. Jar File - `GetPhraseLines.jar`
               2. ClassName -`GetPhraseLines`
               3. InputDirectory - Directory containing the database files
               4. Output Directory - This directory is created by the code. A file is generated named as "part-r-00000" among other files which has the word and the filenumbers,lineNumbers, positionNumbers and words ALONG WITH THE TEXT for that line
               5. PositionString (args[2]) - This contains the position string for the phrase obtained from the previous file. The server will read the file generated in previous step in a single String. All the TAB('\t') characters have to explicitly changed to two separate characters '\\' and 't'. This is because we cannot pass escape characters directly as an argument to a java file. Similarly all the NEWLINE characters needs to be changed to two characters '\\' and 'n'. The java code then finds occurence of the substring "\t" and replaces these two characters backslash and letter t to a TAB again. Similarly the NEWLINE character is replaced.
         2.  Positive Value For files
             1.  Jar File - `PositiveValue.jar`
             2.  ClassName - `PositiveValue`
             3.  InputDirectory - Directory containing the index file
             4.  Output Directory - This directory is created by the code. A file is generated named as "part-r-00000" among other files which has the entries of the form {fileName}TAB{PositiveValueForThatFile} (PositiveValue denotes the number of positive words found in that file)
             5.  PositiveWords (args[2]) - Space Separated Single String with all the positive words
   ***
   3. Spark Service\
   For the spark implementation, we have a separate java class for each function i.e
      - Index Create
      - SearchWord
      - SearchPhrase
      - Positive Value
      
      1. Packaging the jar file\
      In order to run the spark jobs, we first need to pacakge the classes in a jar file using the command - `mvn package` 
      2. Submitting a spark job\
      Using the jar created in the previous step we can submit spark jobs to the cluster using the spark-submit script provided as part  of the spark distribution by apache.
      3. The basic command to run any job on Spark is of the following format
        ```
          {SparkHomeDirectory}spark/bin/spark-submit --class "com.example.{ClassName}" --master local[4] target/{jarFileCreated} {args}
        ```
        - **SparkHomeDirectory** - This is where Spark is installed
        - **ClassName**  is the class whose main function will be used to create a spark job
        - **args** - these are the string args[] passed to the main function of your code. 
      4. Creating an Index
         - ClassName - `IndexCreate`
         - Output - Creates an index file from the database files and stores it
      5. Searching a Word
         - ClassName - `SearchWord`
         - args[0] **(SearchWord)** - The word that needs to be searched in the database files
         - Output - Spark creates a directory as an output which contains multiple files. These files contain the filename, lineNumber, position and the text of the line where **SearchWord** is present.
      6. Searching a phrase
         - ClassName - `SearchPhrase`
         - args[0] **(SearchPhrase)** -  This is a space separated string of the words for which we need to find the positions in the database
         - args[1] **PhraseClause** - "and" or "or" depending on the requirements
         - Output - Spark creates a directory as an output which contains multiple files. These files contain the filename, lineNumber, positions and the text of the line where **SearchPhrase** is present as per the **PhraseClause**.
      7. Positive Value
         - ClassName - `PositiveValue`
         - Output - Spark creates a directory as an output which contains multiple files. These files contain the filename and their positive Value based on the number of positive words conatined in that file.