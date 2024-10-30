#!/bin/bash
 
# Create 25000 files with random word count from 50-250
for i in {1..25000}; do
  echo "Creating file $i..."
  # Generate a random number of words between 50 and 200
  word_count=$((RANDOM % 151 + 50))
 
  # Create a temporary file to store the random words
  tempfile=$(mktemp)
 
  # Generate random words and write them to the temporary file
  for j in $(seq 1 $word_count); do
    echo -n "$RANDOM " >> $tempfile
  done
 
  # Create the final file name
  filename="file_$i.txt"
 
  # Write the contents of the temporary file to the final file
  cat $tempfile > $filename
 
  # Remove the temporary file
  rm $tempfile
done
