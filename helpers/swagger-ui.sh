#!/bin/bash

VERSION=$(<./VERSION)
ROOT_DIR=$(pwd)
echo "version: $VERSION"


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