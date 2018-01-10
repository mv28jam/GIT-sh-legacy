#!/usr/bin/env bash

source ./sh/init.sh

echo -e "Destination path \e[33m$target_path/$release_path$release\e[0m\n"

#create clear main release full project
for service in $service_list 
do 
    git clone -b $parent ssh://git@git.site:7999/$repo_bullet/$service.git $target_path/$release_path$release/$repo_path/$service

done

#create dirs
mkdir -m 0776 $target_path/$release_path$release/.site
mkdir -m 0776 $target_path/$release_path$release/.site/.www

#create symlinks
if [ -L $target_path/$release_path$release/.site/.supervisor ]; then

    ln -s $target_path/.supervisor  $target_path/$release_path$release/.site/.supervisor  

fi

for service in $service_list 
do
    case $service in
	(gbroker)
		cd $target_path/$release_path$release/.site
		ln -s ../$repo_path/$service  ./.broker  
		cd - 2>&1 > /dev/null
		continue
	;;
	(node)
		cd $target_path/$release_path$release/.site
		ln -s ../$repo_path/$service  ./.node  
		cd - 2>&1 > /dev/null
		continue 
	;;
	(queue)
		cd $target_path/$release_path$release/.site
		ln -s ../$repo_path/$service  ./.queue  
		cd - 2>&1 > /dev/null
		continue
	;;
	(framework)
		cd $target_path/$release_path$release/.site
		ln -s ../$repo_path/$service  ./.tf  
		cd - 2>&1 > /dev/null
		continue
	;;
	(cms)
		cd $target_path/$release_path$release/.site
		ln -s ../$repo_path/$service  ./.cms  
		cd - 2>&1 > /dev/null
		continue
	;;
	(gbus)
		cd $target_path/$release_path$release/.site/.www
		ln -s ../../$repo_path/$service  ./bus  
		cd - 2>&1 > /dev/null
		continue
	;;
    esac
    
    cd $target_path/$release_path$release/.site/.www
    ln -s ../../$repo_path/$service  ./$service  
    cd - 2>&1 > /dev/null
	
done

echo -e "Installation is \e[92mdone\e[0m"