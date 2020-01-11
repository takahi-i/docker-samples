#!/usr/bin/env bash
set -o xtrace
set -e

$(aws ecr get-login --no-include-email --region $REGION --profile $ROLE)

echo REGION: $REGION
echo ROLE: $ROLE
echo ID: $AWS_ACCOUNT_ID

docker build -t hello .
echo "built hello"
docker tag hello:latest $AWS_ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/sample:latest
echo "taged"
docker push $AWS_ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/sample:latest
echo "succeded to push image to ecr"
