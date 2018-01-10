#!/usr/bin/env bash

source ./sh/init.sh

#clone repositories
for service in $service_list
do

    if [ $clone = 1 ]
    then
	git clone -b $parent ssh://git@git.tlpt.ru:7999/$repo_bullet/$service.git $target_path/$dev_path/$branch/$repo_path/$service
    fi
    
    if [ -d $target_path/$dev_path/$branch/$repo_path/$service ]; then

	cd $target_path/$dev_path/$branch/$repo_path/$service

	#checkout to master
	git checkout $parent
	#create new branch
	git checkout -b $branch
	#push branch to origin
	git push -u origin $branch 

	cd - 2>&1 > /dev/null
    
    else
	
	echo 'Git clone operation fail!'
	
    fi

done

