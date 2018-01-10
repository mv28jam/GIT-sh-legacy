#!/usr/bin/env bash

source ./sh/init.sh

#clone repositories
for service in $service_list
do

    cd  $target_path/$dev_path/$branch/$repo_path/$service

    #pull changes from origin
    git pull origin $branch
    #get diff of master and current
    git diff $parent..$branch

    cd - 2>&1 > /dev/null

done


