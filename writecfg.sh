#!/usr/bin/env bash

source ./sh/init.sh

service_template='.service-template.php';
service_config='.service.php';

#default domain dev !
domain='dev';

while [[ $# > 1 ]]
    do
	key="$1"
	case $key in
	(-d|--domain)
		domain="$2"
		shift
	;;
	esac
    shift
done

#cycle by repo path
for path in $target_path/$release_path$release/$repo_path/* 
do

    pathname=$(basename $path)
    
    if [ $pathname == 'node' ]
    then

	cp $path/.node-conf-template.php $path/.node-conf.php
	
	if [ $domain != '' ] 
	then
	    sed -i -e 's/.site.ru/.'$domain'.site.ru/g' $path/.node-conf.php
	fi

	cp $path/.node-template.php $path/.node.php
	cp $path/.ring-cluster-conf-template.php $path/.ring-cluster-conf.php

	

    else

	if [ -f $path/$service_template ]; then

	    cp $path/$service_template $path/$service_config
	    sed -i -e 's/'$pathname'.site.ru/'$pathname'.'$domain'.tlpt.ru/g' $path/$service_config

	fi

    fi

done


#static reverse configs FIXME!
#temporary ?
sed -i -e 's/stat.'$domain'.site.ru/stat.tlpt.ru/g' $target_path/$release_path$release/$repo_path/node/.node-conf.php
sed -i -e 's/wstat.'$domain'.site.ru/wstat.tlpt.ru/g' $target_path/$release_path$release/$repo_path/node/.node-conf.php




