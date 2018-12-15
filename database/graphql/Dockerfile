FROM node:alpine

ENV NODE_ENV "production"
ENV WAIT_FOR "https://raw.githubusercontent.com/eficode/wait-for/master/wait-for"

RUN mkdir /worker && \
	npm i -g yarn && \
	wget -O /bin/wait-for.sh $WAIT_FOR && \
	chmod +x /bin/wait-for.sh

ADD package.json /worker/package.json
ADD yarn.lock /worker/yarn.lock

RUN cd /worker && yarn install

WORKDIR /worker
ADD . /worker/

CMD "yarn start"

