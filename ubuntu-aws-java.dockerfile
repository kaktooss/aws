FROM kaktooss/aws:latest

RUN apt-get update && apt-get install --no-install-recommends -yq openjdk-8-jdk-headless && \
    apt-get autoremove -yq && apt-get clean -yq && rm -rf /var/lib/apt/lists/*

