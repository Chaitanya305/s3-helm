#!/bin/bash

if helm plugin ls | awk '{print $1}' | grep -iq s3; then
  echo plugin is present.
else
  echo installing helm s3 plugins ....
  helm plugin install https://github.com/hypnoglow/helm-s3.git
fi

read -p "Provide s3 Bucket name: " bucket_name

#read -p "Chart name: " chart_name

#read -p "Chart Version: " chart_version

read -p "helm package path: " package_path

helm s3 init s3://${bucket_name}/charts
helm repo add charts s3://${bucket_name}/charts
helm s3 push --relative ${package_path}  charts

echo "repo url is : s3://${bucket_name}/charts"
