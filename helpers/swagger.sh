#!/bin/bash

VERSION=$(<./VERSION)
ROOT_DIR=$(pwd)
FILENAME="index.html"
SEARCH="https://petstore.swagger.io/v2/swagger.json"
REPLACE="https://digital-swagger.s3.amazonaws.com/api.yml"


if mkdir -p $ROOT_DIR/helpers/dist; then
  echo "storage directory created"
else
    echo "unable to create storage directory"
  exit 1
fi

cd $ROOT_DIR/helpers/dist/


if wget https://github.com/swagger-api/swagger-ui/archive/$VERSION.tar.gz; then
  echo "complete download successfully" >&2
else
  echo "could not complete download"
  exit 1
fi

if tar -vzxf $ROOT_DIR/helpers/dist/$VERSION.tar.gz; then
     echo "successfully unzipped" >&2
else
  echo "error when unzipping file"
fi

cd $ROOT_DIR/helpers/dist/swagger-ui-3.24.3/dist/

echo "from: $SEARCH"
echo "to: $REPLACE"


if [[ $SEARCH != "" && $REPLACE != "" ]]; then
  sed -i -e "s|$SEARCH|$REPLACE|g" $ROOT_DIR/helpers/dist/swagger-ui-3.24.3/dist/$FILENAME

fi