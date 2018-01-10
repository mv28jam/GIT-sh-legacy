#!/usr/bin/env bash

source ./sh/init.sh

#goto to service path
cd $target_path/$release_path$release/$repo_path/$service

git fetch

git checkout -B $release

git pull origin $release

git merge origin/$branch

git push -u origin $release

cd - 2>&1 > /dev/null



