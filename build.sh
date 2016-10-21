#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker build --pull -t amissemer/git-sync-jenkins:2.19.1 $DIR
docker build --pull -t amissemer/git-sync-jenkins:2.19.1-swarm -f Dockerfile-swarm $DIR
