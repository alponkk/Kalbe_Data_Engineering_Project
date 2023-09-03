#!/bin/bash

path="hdfs/data/data1"
name_of_directory="data1"
filename_excel="daily_market_price.xlsx"
source_dir="/local/data/market"
target_dir="$path/$name_of_directory"

# Check if the directory exists
if [ -d "$target_dir" ]; then
    echo "There is $name_of_directory Directory Exists!"
else
    echo "$name_of_directory Directory Not Exists!"
    
    # Create the directory inside the path
    mkdir -p "$target_dir"
    
    if [ $? -eq 0 ]; then
        echo "Created $name_of_directory Directory."
    else
        echo "Failed to create $name_of_directory Directory."
        exit 1
    fi
fi

# Copy the file from the source directory to the target directory
if [ -f "$source_dir/$filename_excel" ]; then
    cp "$source_dir/$filename_excel" "$target_dir/"
    
    if [ $? -eq 0 ]; then
        echo "File $filename_excel copied successfully."
        echo "File Moved Successfully" > "$target_dir/log.txt"
    else
        echo "Failed to copy $filename_excel."
    fi
else
    echo "File $filename_excel not found in source directory."
fi
