#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker build --pull -t amissemer/git-sync-jenkins:2.7.2 $DIR
