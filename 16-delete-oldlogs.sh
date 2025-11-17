#!/bin/bash

Files_directory="/home/ec2-user"

# Find files and loop safely
find "$Files_directory" -name "*.log" -mtime +14 | while read file
do
    rm -f "$file"
done

echo "Files older than 14 days are deleted"
