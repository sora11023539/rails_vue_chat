FROM node:16.20.0

RUN mkdir -p /app
WORKDIR /app
RUN apt-get update -qq && \
    npm install -g npm && \
    npm install -g @vue/cli

COPY package.json .
RUN npm install
