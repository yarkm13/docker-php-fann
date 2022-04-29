#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Usage: run.sh index.php"
    echo "       Where index.php - php script name in app directory"
    exit 1
fi
docker container run --rm -v $(pwd)/app:/app/ fann-php-cli php /app/$1