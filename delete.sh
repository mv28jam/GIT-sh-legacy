#!/usr/bin/env bash

source ./sh/init.sh

if [ -d $target_path/$dev_path/$branch ]; then
    
    for path in $target_path/$dev_path/$branch/$repo_path/*/; do
	cd $path
	git push --delete origin $branch
	cd - 2>&1 > /dev/null

    done

    rm -rf $target_path/$dev_path/$branch 2>&1 

fi
