#!/usr/bin/env bash

#default define
target_path='/var/www/site';
release_path='RELEASES/';#ending slash! 
dev_path='DEV';
dev_test_path='DEV-TEST';
repo_path='repositories';
service='test';
release='TEST';
branch='test';
service_list='test';
clone=1;
repo_bullet='dev';
parent='main';
#end of default define

#input parameters parse
while [[ $# > 1 ]]
    do
	key="$1"
	case $key in
	(-r|--release)
		release="$2"
		shift
	;;
	(-b|--branch)
		branch="$2"
		shift
	;;
	(-sl|--service_list)
		service_list="$2"
		shift
	;;
	(-tp|--target_path)
		target_path="$2"
		shift
	;;
	(-s|--service)
		service="$2"
		shift
	;;
	(-c|--clone)
		clone="$2"
		shift
	;;
	(-rb|--repo_bullet)
		repo_bullet="$2"
		shift
	;;
	(-rp|--release_path)
		release_path="$2"
		shift
	;;
	(-p|--parent)
		parent="$2"
		shift
	;;
	esac
    shift
done
#end of parse
