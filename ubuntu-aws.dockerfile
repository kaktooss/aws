FROM ubuntu:18.04

ARG HELM_VERSION=2.11.0
ENV HELM_VERSION=$HELM_VERSION

ARG TERRAFORM_VERSION=0.11.10
ENV TERRAFORM_VERSION=$TERRAFORM_VERSION

ENV DEBIAN_FRONTEND=noninteractive

RUN curl -O https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN curl -L https://storage.googleapis.com/kubernetes-helm/helm-v$HELM_VERSION-linux-amd64.tar.gz | \
    tar -xvz --strip=1 -C /usr/bin

RUN sed -i '/^deb-src /s/^/#/' /etc/apt/sources.list && \
    apt-get update && apt-get -yq upgrade && \
    apt-get install --no-install-recommends -yq \
        zip unzip openssh-client wget curl ca-certificates git \
        python3 python3-pip python3-setuptools python3-wheel \
        docker.io && \
    pip3 install awscli --upgrade && \
    apt-get autoremove -yq && apt-get clean -yq && rm -rf /var/lib/apt/lists/*
