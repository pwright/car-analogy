FROM node:10

RUN  npm i -g @antora/cli@2.2 @antora/site-generator-default@2.2

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
