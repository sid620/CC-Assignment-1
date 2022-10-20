# Hadoop Files and how to use them

Each java file needs to be compiled first to generate .class files and then need to converted to a jar file
### Command for compiling 
**[Home directory of hadoop]/bin/hadoop com.sun.tools.javac.Main <JavaFileName>.java**
### Command for creating jar file
**jar -cvf <NameofJarFileToBeCreated>.jar <JavaFileName>\*.class**

### Command for running a jar file
**hadoop jar <AbsolutePathToTheJarCreatedInPreviousStep> <NameofClassContainingMainInJavaFile> <AbsolutePathToTheDirectoryContainingInputFiles> <AbsolutePathToTheDirectoryContainingOutputFiles> <MoreArgumentsAsPerRequirement>**

For eg. for creating index, the following command can be executed(by appropriately changing the HomeDirectory)
*hadoop jar /home/tushar/Downloads/HadoopFiles/InvertedIndex.jar InvertedIndex /home/tushar/Downloads/HadoopFiles/input /home/tushar/Downloads/HadoopFiles/output*

*Given that all the database files are stored in a directory named "input". The command needs to be adjusted according to the directory name containing the files. Also this generates the output in a directory named "output". The command fails if such a directory already exists.*

> <AbsolutePathToTheDirectoryContainingInputFiles> is treated as the first argument or args[0] by the java code
<AbsolutePathToTheDirectoryContainingOutputFiles> is treated as the second arguement or args[1] by the java code.
These two arguments are to be provided in all the cases

**NOTE - The JAR files are already created for all the java files and are present in the folder. Only the run command needs to be called by the server**

## For Building Index
- Jar Name - InvertedIndex.jar
- Input Directory - Directory containing all the database files 
- Output Directory - This directory is created by the code. A file is generated named as "part-r-00000" among other files which has the generated Index

No Other Arguments are required
(An example of how the file looks can be seen in the IndexOutput Directory)
Each entry of the form
**<word>TAB<filename>SPACE<linenumber>SPACE<positionNumber>**

## For Searching Word

Two Processes will have to be run one after the other.
The first process searches the word using the index file.
The second process will generate the final output by using the output of the previous process.

### First Process - Finding Positions from the Index File
- Jar Name - SearchWord.jar
- Input Directory - Directory containing the index file (Same as the output directory of build index)
- Output Directory - This directory is created by the code. A file is generated named as "part-r-00000" among other files which has the word and the filenumbers,lineNumbers and positionNumbers 

Each entry of the form
**<word>TAB<filenumber1>SPACE<linenumber1>SPACE<positionNumber1>SPACE<filenumber2>SPACE<linenumber2>SPACE<positionNumber2>... so on**
(An example of how the file looks can be seen in the SearchOutput Directory which shows the output for a word searched "dance")

- Search Word (args[2]) - The word that needs to be searched in all the files

### Second Process - Finding the text for the corresponding filenumber and linenumber
- Jar Name - GetLines.jar
- Input Directory - Directory containing the database files
- Output Directory - This directory is created by the code. A file is generated named as "part-r-00000" among other files which has the word and the filenumbers,lineNumbers and positionNumbers ALONG WITH THE TEXT for that line
- PositionString (args[2]) - This contains the position string for that word obtained from the previous file. The server will read the file generated in previous step in a single String and will truncate the <word> and TAB. The rest of the string is passed as a single argument as the third argument to this jar

So for the dance example the command looks like
**hadoop jar <AbsolutePathHomeDirectory>/GetLines.jar GetLines <AbsolutePathHomeDirectory>/input <AbsolutePathHomeDirectory>/<OutputDirectoryName> "essays.txt 4703 4 bartle-m 7229 7 being.txt 64 7 the_dark.er_ 2528 1 the_dark.er_ 2182 1 the_dark.er_ 2179 10 jargn10.txt 14890 10 jargn10.txt 19266 7 jargn10.txt 19026 4 jargn10.txt 19538 3 jargn10.txt 14886 2 jargn10.txt 7201 9 asp5202.txt 18435 1 inkeeping-cyberspace 356 7 amihist.txt 107 8 lanier.txt 386 1 lanier.txt 176 3 cybcraft.txt 1237 2 cybcraft.txt 2164 1"** 

The output of this command is in the directory SearchWordOutputLines

## For Searching a Phrase

Two Processes will have to be run one after the other.
The first process searches the word using the index file.
The second process will generate the final output by using the output of the previous process.
### First Process - Finding Positions from the Index File
- Jar Name - SearchPhrase.jar
- Input Directory - Directory containing the index file (Same as the output directory of build index)
- Output Directory - This directory is created by the code. A file is generated named as "part-r-00000" among other files which has the filenumbers,lineNumbers and positionNumbers along with the words found. 

Each entry of the form
**<filenumber>SPACE<linenumber>TAB<positionNumber1>SPACE<wordAtPositionNumber1>SPACE<positionNumber2>SPACE<wordAtPositionNumber2>... so on and NEWLINE_CHARACTER IN THE END**
(An example of how the file looks can be seen in the SearchOutput Directory which shows the output of a phrase searched "dance" OR "rain") 

- Search Phrase (args[3]) - Single space separated string containing all the words in a phrase
- Search Clause(args[4]) - String EITHER "and" OR "or". Self Explanatory

### Second Process - Finding the text for the corresponding filenumber and linenumber
- Jar Name - GetPhraseLines.jar
- Input Directory - Directory containing the database files
- Output Directory - This directory is created by the code. A file is generated named as "part-r-00000" among other files which has the word and the filenumbers,lineNumbers, positionNumbers and words ALONG WITH THE TEXT for that line
- PositionString (args[2]) - This contains the position string for the phrase obtained from the previous file. The server will read the file generated in previous step in a single String. All the TAB('\t') characters have to explicitly changed to two separate characters '\\' and 't'. This is because we cannot pass escape characters directly as an argument to a java file. Similarly all the NEWLINE characters needs to be changed to two characters '\\' and 'n'. The java code then finds occurence of the substring "\t" and replaces these two characters backslash and letter t to a TAB again. Similarly the NEWLINE character is replaced.

So for the dance OR RAIN example the command looks like
**hadoop jar <AbsolutePathHomeDirectory>/GetPhraseLines.jar GetPhraseLines <AbsolutePathHomeDirectory>/input <AbsolutePathHomeDirectory>/<OutputDirectoryName> "amihist.txt 107\t8 dance\nasp5202.txt 18435\t1 dance\nbartle-m 6667\t6 rain\nbartle-m 7229\t7 dance\nbartle-m 9331\t3 rain\nbeing.txt 64\t7 dance\ncheats 736\t10 rain\ncheats 743\t8 rain\ncybcraft.txt 1237\t2 dance\ncybcraft.txt 2164\t1 dance\nessays.txt 3938\t5 rain\nessays.txt 4703\t4 dance\nessays.txt 4856\t12 rain\ngalileo.txt 413\t11 rain\ninkeeping-cyberspace 356\t7 dance\njargn10.txt 1099\t2 rain\njargn10.txt 14886\t1 rain 2 dance\njargn10.txt 14890\t10 dance 9 rain\njargn10.txt 19026\t3 rain 4 dance\njargn10.txt 19266\t7 dance 6 rain\njargn10.txt 19538\t2 rain 3 dance\njargn10.txt 6129\t1 rain\njargn10.txt 7201\t9 dance\nlanier.txt 176\t3 dance\nlanier.txt 386\t1 dance\ntaeis.lng 40\t4 rain\nteletype.his 130\t4 rain\nthe_dark.er_ 2179\t10 dance\nthe_dark.er_ 2182\t1 dance\nthe_dark.er_ 2374\t9 rain\nthe_dark.er_ 2528\t1 dance\nthe_dark.er_ 4146\t9 rain\nthe_dark.er_ 4165\t14 rain\nthe_dark.er_ 4455\t7 rain\n"** 

**Note here \t is not a single character but two separate characters backslash and a letter t. Similarly \n is actually two character backslash and the letter n**

The output of this command is in the directory SearchWordOutputLines

## For Getting the Positive Values for all files
- Jar Name - PositiveValue.jar
- Input Directory - Directory containing the index file
- Output Directory - This directory is created by the code. A file is generated named as "part-r-00000" among other files which has the entries of the form <fileName>TAB<PositiveValueForThatFile> (PositiveValue denotes the number of positive words found in that file)
- PositiveWords (args[2]) - Space Separated Single String with all the positive words

For example if the positive words are ["good","great","excellent","beautiful","love"] then the command looks like
**hadoop jar <AbsolutePathHomeDirectory>/PositiveValue.jar PositiveValue <AbsolutePathHomeDirectory>/indexOutput <AbsolutePathHomeDirectory>/<OutputDirectoryName> "good great excellent beautiful love"**

An output of this command is in the directory Positive Value
