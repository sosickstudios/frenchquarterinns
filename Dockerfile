FROM node:latest

ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /frenchquarterinns && cp -a /tmp/node_modules /frenchquarterinns/

WORKDIR /frenchquarterinns

CMD node_modules/.bin/gulp compile