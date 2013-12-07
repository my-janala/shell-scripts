#!/bin/bash

file=.find_large_files.sh

if [ -f "$file" ]; then
	echo "$file exists"
else
	echo "No File"
fi
