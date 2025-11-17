#!/bin/bash

  

#a=0

# while [ $a -lt 10 ]
 #do
   # echo $a
   # a=`expr $a + 1` 
 #done

 while IFS= -r line
 do
   echo "$line"
 done < 14-set.sh