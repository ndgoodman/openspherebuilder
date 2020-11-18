FROM node:14.15.1-buster

ENV NODE_VERSION 14.15.1
ENV YARN_VERSION 1.22.5
ENV JAVA_VERSION openjdk11

RUN mkdir /workspace \
  && mkdir /web-content
RUN cd /workspace \
  && git clone https://github.com/ngageoint/opensphere-yarn-workspace.git
RUN cd /workspace/opensphere-yarn-workspace/workspace/ \
  && git clone https://github.com/ngageoint/opensphere.git
RUN cd /workspace/opensphere-yarn-workspace/ \
  && yarn install --network-timeout 100000
RUN wget https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_linux-x64_bin.tar.gz \
  && tar -xzf  openjdk-11+28_linux-x64_bin.tar.gz -C /opt/

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/jdk-11/bin

COPY docker-entrypoint.sh /usr/local/bin/

CMD /usr/local/bin/docker-entrypoint.sh
