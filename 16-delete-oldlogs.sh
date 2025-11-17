#!/bin/bash

Files_directory=/home/ec2-user/
Files_to_delete=$(find $Files_directory -name "*.log" -mtime +14)

rm -rf /$Files_directory/$Files_to_delete

echo " Files older than 14 days are deleted"