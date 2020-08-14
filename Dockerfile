FROM ubuntu:18.04

ARG sdk_version="6.3.12"

RUN apt-get update \            
    && apt-get install --yes wget gnupg openjdk-8-jdk apt-transport-https
    
RUN echo "deb https://packages.atlassian.com/debian/atlassian-sdk-deb/ stable contrib" >>/etc/apt/sources.list \                
    && wget https://packages.atlassian.com/api/gpg/key/public \
    && apt-key add public \
    && apt-get update \
    && apt-get install --yes atlassian-plugin-sdk=${sdk_version}

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
CMD ["atlas-debug"]
