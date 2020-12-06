#!/usr/bin/make

ROOT_DIR:=$(shell pwd)
VERSION:= "3.24.3"

AWS_S3_NAME:="digital-aws"
AWS_S3_REGION:="sa-east-1"

help:
	@echo 'Usage: make <OPTIONS> ... <TARGETS>'
	@echo '    build                build project for current platform.'
	@echo '    deploy               deploy swagger-ui on s3 .'
	@echo '    all                  execute all commands.'

build:
	@helpers/swagger.sh

deploy:
	@aws s3 sync $(ROOT_DIR)/helpers/dist/swagger-ui-$(VERSION)/dist/ s3://$(AWS_S3_NAME) \
            --acl public-read --region $(AWS_S3_REGION)
clean:
	@rm -Rf $(ROOT_DIR)/helpers/dist/

all:
	@make -s build
	@make -s deploy
	@make -s clean

