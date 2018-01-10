#!/usr/bin/env bash

source ./sh/init.sh

rm $target_path/current
ln -sf $target_path/$release_path$release $target_path/current




