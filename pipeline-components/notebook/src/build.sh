#!/bin/bash -e
PROJECT_ID=$1

if [ -z "$2" ]; then
  TAG_NAME="latest"
else
  TAG_NAME="$2"
fi


CONTAINER_NAME=papermill

docker build -t ${CONTAINER_NAME} .
docker tag ${CONTAINER_NAME} quay.io/volvocars/${PROJECT_ID}:${CONTAINER_NAME}${TAG_NAME}
docker push quay.io/${PROJECT_ID}/${CONTAINER_NAME}:${TAG_NAME}
# Output the strict image name (which contains the sha256 image digest)
docker inspect --format="{{index .RepoDigests 0}}" "${IMAGE_NAME}"
