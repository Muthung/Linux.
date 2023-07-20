## Word Frequency

### Question 

Write a bash script to calculate the frequency of each word in a text file *words.txt*.

For simplicity sake, you may assume:

- *words.txt* contains only lowercase characters and space ' ' characters.

- Each word must consist of lowercase characters only.

- Words are separated by one or more whitespace characters.

#### Implementation 

- *cat words.txt* : This reads the content of words.txt and outputs it to the next command in the
   pipeline.

- *tr -s ' ' '\n'* : This translates (replaces) all spaces ' ' to newlines '\n', effectively
   splitting the words into separate lines.

- *sort* : This sorts the words in alphabetical order.
    
- *uniq -c* : This removes duplicate lines (words) and prefixes each line with the count of 
  occurrences.
    
- *sort -nr* : This sorts the output numerically (-n) in reverse order (-r), which puts the words 
   with the highest frequency at the top.

- *awk '{print $2, $1}'* : This uses awk to print the word and its frequency count in the desired 
  format (word count).