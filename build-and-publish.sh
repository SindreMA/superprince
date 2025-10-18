#!/bin/bash

set -e

IMAGE_NAME="superprince"
REGISTRY="registry.k8s.sindrema.com/images"
TAG="latest"

echo "Building Docker image..."
docker build -t ${IMAGE_NAME}:${TAG} .

echo "Tagging image for registry..."
docker tag ${IMAGE_NAME}:${TAG} ${REGISTRY}/${IMAGE_NAME}:${TAG}

echo "Pushing to registry..."
docker push ${REGISTRY}/${IMAGE_NAME}:${TAG}

echo "Build and publish completed successfully!"
echo "Image: ${REGISTRY}/${IMAGE_NAME}:${TAG}"
