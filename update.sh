#! /bin/bash
set -e

git submodule update --init --recursive
git submodule foreach git pull --recursive-submodule origin master
