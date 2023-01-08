FROM ubuntu:22.04

RUN apt update && apt install -y \
    git \
    curl \
    && echo "All tools has been installed successfully"

RUN curl https://api.ipify.org/?format=text
