FROM node:alpine

ENV NODE_ENV "production"

RUN mkdir /worker && \
	npm i -g yarn

ADD package.json /worker/package.json
ADD yarn.lock /worker/yarn.lock

RUN cd /worker && yarn install

WORKDIR /worker
ADD . /worker/

ENTRYPOINT ["yarn", "start"]
