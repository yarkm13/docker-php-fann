#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Usage: run.sh index.php"
    echo "       Where index.php - php script name in app directory"
    exit 1
fi

if [ ! -f "$(pwd)/app/$1" ]; then
    echo "File $(pwd)/app/$1 does not exist"
    exit 2
fi

images=$(docker image ls | grep fann-php-cli)

if [ -z "$images" ]; then
    echo "You have no FANN images. Try to build one using ./build.sh"
else
    num_matches=$(echo "$images" | wc -l);
    if [ $num_matches -eq 1 ]; then
      contstr=$images
    else
      echo "$(echo "$images" | nl)"
      echo "Chose image:"
      read imgnum
      contstr=$(echo "$images" | sed -n ${imgnum}p)
    fi
    container=$(echo "$contstr" | sed -E 's/^fann-php-cli[[:space:]]+([[:graph:]]+).*/fann-php-cli:\1/')
    docker container run --rm -v $(pwd)/app:/app/ $container php /app/$1
fi

