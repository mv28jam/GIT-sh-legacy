#!/usr/bin/env bash

source ./sh/init.sh

#goto to service path
cd $target_path/$release_path$release/$repo_path/$service

git checkout $release

git status

git push -u origin $release

cd - 2>&1 > /dev/null




