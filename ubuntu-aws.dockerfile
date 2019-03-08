FROM ubuntu:18.04

ARG HELM_VERSION=2.11.0
ENV HELM_VERSION=$HELM_VERSION

ENV DEBIAN_FRONTEND=noninteractive

RUN sed -i '/^deb-src /s/^/#/' /etc/apt/sources.list && \
    apt-get update && apt-get -yq upgrade && \
    apt-get install --no-install-recommends -yq zip unzip openssh-client wget curl python3 python3-pip python3-setuptools docker.io ca-certificates git && \
    curl -L https://storage.googleapis.com/kubernetes-helm/helm-v$HELM_VERSION-linux-amd64.tar.gz | tar -xvz --strip=1 -C /usr/bin && \
    pip3 install wheel awscli --upgrade && \
    apt-get autoremove -yq && apt-get clean -yq && rm -rf /var/lib/apt/lists/*