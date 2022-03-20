#!/usr/bin/env bash

SCRIPT_DIR=$(realpath $(dirname $0))
ROOT_DIR=$(dirname $SCRIPT_DIR)

OUTPUT_DIR=$ROOT_DIR/output

APP_NAME=$1
if [[ $APP_NAME == "" ]]; then
    echo "USAGE: $0 [APP_NAME]"
    exit
fi

mkdir -p $OUTPUT_DIR

docker-compose build
docker-compose up -d
#docker-compose exec web npx create-react-app $APP_NAME --template typescript
docker-compose exec web yarn create react-app $APP_NAME --template typescript

echo "DONE"
#sudo ls /var/lib/docker/volumes/react_cli_react_data/_data/$APP_NAME

#echo "sudo cp -a /var/lib/docker/volumes/react_cli_react_data/_data/$APP_NAME $APP_NAME && sudo chown -R ${id -un}:${id -gn} $APP_NAME"
sudo cp -a /var/lib/docker/volumes/react_cli_react_data/_data/$APP_NAME $OUTPUT_DIR/$APP_NAME
sudo chown -R $(id -un):$(id -gn) $OUTPUT_DIR/$APP_NAME
ls -al $OUTPUT_DIR/$APP_NAME
echo $OUTPUT_DIR/$APP_NAME
