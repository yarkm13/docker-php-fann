#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Usage: build.sh VERSION"
    echo "       Where VERSION - supported php version"
    echo "       See github.com/docker-library/docs/blob/master/php/README.md for supported tags"
    echo "       use *-cli versions"
    echo "Existing local images:"
    docker image ls | grep fann-php-cli
    exit 1
fi
docker build --build-arg phpver=$1 -t fann-php-cli:$1 .