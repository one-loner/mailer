#!/bin/bash
files=$(ls /home/user/encrypted)
#echo $files
for line in $files; do
#   gpg -d $line 2>/dev/null
    echo $line
    echo '-----'
    gpg -d $line
done
