#!/usr/bin/env bash

source ./sh/init.sh

#goto to service path
cd $target_path/$release_path$release/$repo_path/$service

git checkout $release

git diff --name-only $parent..$release

cd - 2>&1 > /dev/null





