#!/bin/bash
set -euo pipefail

cd $(dirname $0)

echo ">> Bundling AWS Lambda handler inside a docker image..."

TAG='lambda-handler'

docker build -t ${TAG} .

echo ">> Running handler from the build container..."
docker run -i -a stdout ${TAG} start

echo ">> Stopping container..."
# docker rm -f ${CONTAINER}
