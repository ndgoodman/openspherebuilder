FROM node:lts

# Install Java 8 JRE
RUN apt-get -y update && apt-get -y install openjdk-8-jre-headless
# Install node-canvas dependencies (for opensphere-plugin-geopackage / geopackage-js)
RUN apt-get -y install build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev pkg-config

RUN mkdir /workspace \
  && mkdir /web-content
RUN cd /workspace \
  && git clone https://github.com/ngageoint/opensphere-yarn-workspace.git
RUN cd /workspace/opensphere-yarn-workspace/workspace/ \
  && git clone https://github.com/ngageoint/opensphere.git
RUN cd /workspace/opensphere-yarn-workspace/ \
  && yarn install --network-timeout 100000

COPY docker-entrypoint.sh /usr/local/bin/

CMD /usr/local/bin/docker-entrypoint.sh
