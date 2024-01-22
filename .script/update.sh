#!/bin/bash

# This script copy all the configuration file from the specified directories
#
# In the file list.txt write all the directories or file and the directory for each file where the selected files should be copied.
# The target directory if not exist you have to create it.

# The path of the list file with all file/directories and target directories.
config="list.txt"

# The home path of all configs backup.
pathToRoot="${HOME}/Documents/arch-config/"

while read line; do
    dir=
    path=
    for x in $line ; do
        if [ -z "$path" ]; then     
            path=$HOME"/"$x
        else 
            dir="${x}";
        fi
    done
    echo "$dir : $path"
    cp -r ${path} ${pathToRoot}${dir}
done < $config

