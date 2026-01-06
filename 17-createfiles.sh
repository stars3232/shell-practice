#!/bin/bash

Target_dir="/home/ec2-user/logfiles"

mkdir -p "$Target_dir"

Files_to_create=("dfg.log" "rt.log" "gydga.sh" "qsdf.log" "tgv.log" "oijk.js")
New_files=("qasvv.log" "bhhg.java" "uhvs.py" "nvxd.txt" "zdfgb.log")

for i in "${Files_to_create[@]}"
do 
  touch -d 20240101 "$Target_dir/$i"
done 

for j in "${New_files[@]}"
do 
  touch "$Target_dir/$j"
done 

echo "Files are created successfully in $Target_dir"



