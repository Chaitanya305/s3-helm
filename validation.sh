#!/bin/bash

if helm plugin ls | awk '{print $1}' | grep -iq s3; then
  echo plugin is present.
else
  echo installing helm s3 plugins ....
  helm plugin install https://github.com/hypnoglow/helm-s3.git
fi

# adding repo 
read -p "Enter repo name: " repo_name
read -p "Enter repo url: " repo_url

helm repo add ${repo_name} ${repo_url}
