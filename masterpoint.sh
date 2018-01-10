#!/usr/bin/env bash

source ./sh/init.sh

#goto to service path
cd $target_path/$release_path$release/$repo_path/$service

git fetch 2>&1 > /dev/null

git checkout $branch 2>&1 > /dev/null

git rev-list --left-right --count origin/main...$branch

cd - 2>&1 > /dev/null






