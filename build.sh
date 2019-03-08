#!/usr/bin/env bash

export VERSION=`date +%Y%m%d-%H%M%S -u`

docker build  -f ubuntu-aws.dockerfile       -t kaktooss/aws       -t kaktooss/aws:${VERSION} .
docker push kaktooss/aws:${VERSION}
docker push kaktooss/aws:latest

docker build  -f ubuntu-aws-java.dockerfile  -t kaktooss/aws-java  -t kaktooss/aws-java:${VERSION} .
docker push kaktooss/aws-java:${VERSION}
docker push kaktooss/aws-java:latest
