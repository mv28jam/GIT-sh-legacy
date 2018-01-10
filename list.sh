#!/usr/bin/env bash

source ./sh/init.sh

for path in $target_path/$dev_path/$branch/$repo_path/* 
do
   
    pathname=$(basename $path)
    echo $pathname

done
