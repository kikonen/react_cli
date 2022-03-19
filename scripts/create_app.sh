#!/usr/bin/env bash

APP_NAME=$1

if [[ $APP_NAME == "" ]]; then
    echo "USAGE: $0 [APP_NAME]"
    exit
fi

docker-compose build
docker-compose up -d
docker-compose exec web npx create-react-app $APP_NAME --template typescript

echo "DONE"
sudo ls /var/lib/docker/volumes/react_cli_react_data/_data/$APP_NAME

echo "cp -a /var/lib/docker/volumes/react_cli_react_data/_data/$APP_NAME ."
