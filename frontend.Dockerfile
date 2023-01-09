FROM node:16.19.0-bullseye-slim

RUN apt update && apt install -y \
    git \
    curl \
    && echo "All tools has been installed successfully"

RUN curl -s https://api.ipify.org/?format=text

ARG ANTI_CACHE

RUN git -c core.sshCommand="ssh -i /run/secrets/git_rsa" clone git@github.com:dzubape/vps-build-user.git && cd vps-build-user && test-user.sh