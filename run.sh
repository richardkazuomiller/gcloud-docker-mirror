#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
while read digest; do
  source=gcr.io/cloud-builders/gcloud@$digest
  target=docker.pkg.github.com/$GITHUB_REPOSITORY/gcloud
  docker pull $source || exit 1
  docker tag $source $target || exit 1
  docker push $target || exit 1
done <digests.txt