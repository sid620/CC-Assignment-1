#!/bin/bash

# First Argument is the hdfs directory
# Second Argument is the temporary directory - Assumes that temp directory does not exist already
# Third Argument is the file which will have the concatenated content - Assumes this file does not already exist
hdfs dfs -get $1 $2
touch $3
for filename in $2/*; do
    cat "$filename" >> $3
done
