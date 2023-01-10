FROM alpine/git:2.36.3 as loadrep

COPY ./deploy-ssh /root/.ssh

ARG REMOTE_REPOSITORY
ARG KEY_FILENAME

RUN git -c core.sshCommand="ssh -i /root/.ssh/${KEY_FILENAME} -o 'StrictHostKeyChecking no'" \
    clone --depth=1 ${REMOTE_REPOSITORY} /app

FROM node:16.19.0-bullseye-slim

COPY --from=loadrep /app /app

WORKDIR /app

ENTRYPOINT ["./entrypoint.sh"]