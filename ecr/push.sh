#!/usr/bin/env bash

DOCKER_CONTENT_TRUST=1
AWS_ACCOUNT_ID=xxxxxxxxxxx
REGION=ap-northeast-1

$(aws ecr get-login --no-include-email --region ap-northeast-1 --profile takahi-i-2)

docker build -t hello .
echo "built hello"
docker tag hello:latest $(AWS_ACCOUNT_ID).dkr.ecr.$(REGION).amazonaws.com/sample:latest
echo "taged"
docker push $(AWS_ACCOUNT_ID).dkr.ecr.$(REGION).amazonaws.com/sample:latest
echo "succeded to push image to ecr"
