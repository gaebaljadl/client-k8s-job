#!/bin/bash

SERVICE1_URL=$1
EXPECTED_RESULT=$2

cd build &&
docker build . -t ghcr.io/gaebaljadl/client:latest --build-arg SERVICE1_URL=$SERVICE1_URL --build-arg EXPECTED_RESULT=$EXPECTED_RESULT &&
docker push ghcr.io/gaebaljadl/client:latest &&
cd .. &&
kubectl delete job client &&
kubectl apply -f client-job.yaml