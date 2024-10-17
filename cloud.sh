#!/bin/bash

cf-remote spawn --platform ubuntu-24 --name aws-hub --count 1 --role hub
cf-remote spawn --platform ubuntu-24 --name aws-cli --count 1 --role client

sleep 30

cf-remote install --bootstrap aws-hub --hub aws-hub --package https://buildcache.cfengine.com/packages/testing-pr/jenkins-pr-pipeline-11292/PACKAGES_HUB_x86_64_linux_ubuntu_24/cfengine-nova-hub_3.25.0a.9486be48a~35470.ubuntu24_amd64.deb
cf-remote install --bootstrap aws-hub --clients aws-cli --package https://buildcache.cfengine.com/packages/testing-pr/jenkins-pr-pipeline-11292/PACKAGES_x86_64_linux_ubuntu_24/cfengine-nova_3.25.0a.9486be48a~35470.ubuntu24_amd64.deb

# cfbs build
# cf-remote deploy --hub aws-cli
