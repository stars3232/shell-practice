#!/bin/bash

movies=("abc" "xyz" "y2k" "234")

echo "first movie name is ${movies[0]}"

echo "all movie names are ${movies[@]}"

echo "fifth movie name is ${movies[4]}"