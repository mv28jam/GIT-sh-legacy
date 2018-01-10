#!/usr/bin/env bash

source ./sh/init.sh

for path in $target_path/$dev_test_path/$repo_path/*/; do

    cd $path
    git fetch
    git checkout -f $parent
    cd - 2>&1 > /dev/null

done

#rewind dev
for service in $service_list 
do

    cd $target_path/$dev_test_path/$repo_path/$service

    #rewind 
    git fetch
    git checkout -f $branch
    git pull origin $branch

    cd - 2>&1 > /dev/null

done



