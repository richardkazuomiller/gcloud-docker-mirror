#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
while read digest; do
  echo "$digest"
  source=gcr.io/cloud-builders/gcloud@$digest
  target=docker.pkg.github.com/$GITHUB_REPOSITORY/gcloud
  docker pull $source
  docker tag $source $target
  docker push $target
done <digests.txt