#!/bin/bash

# Check git for updates
echo "Checking Opensphere yarn repo for updates"
cd /workspace/opensphere-yarn-workspace
git pull
echo "Checking Opensphere repo for updates"
cd /workspace/opensphere-yarn-workspace/workspace/opensphere/
git pull

# Updating yarn dependencies
echo "Updating yarn dependencies"
cd /workspace/opensphere-yarn-workspace
yarn install

# Build Opensphere
echo "Building OpenSphere"
cd /workspace/opensphere-yarn-workspace/workspace/opensphere/
yarn build

# Move Opensphere to web-content
echo "Move Opensphere to web-content"
mv /workspace/opensphere-yarn-workspace/workspace/opensphere/dist/openshere /web-content/
