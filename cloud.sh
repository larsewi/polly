#!/bin/bash

cf-remote spawn --platform debian-12 --name cloud-hub --count 1 --role hub
cf-remote spawn --platform ubuntu-24 --name cloud-cli --count 1 --role client

for sec in {30..1}
do
    echo Waiting $sec seconds ...
    sleep 1
done

# 3.24.0-build1
# cf-remote install --package "https://buildcache.cfengine.com/packages/testing-pr/jenkins-pr-pipeline-11010/PACKAGES_HUB_x86_64_linux_debian_12/cfengine-nova-hub_3.24.0-1.debian12_amd64.deb" --bootstrap cloud-hub --hub cloud-hub
# cf-remote install --package "https://buildcache.cfengine.com/packages/testing-pr/jenkins-pr-pipeline-11010/PACKAGES_x86_64_linux_ubuntu_24/cfengine-nova_3.24.0-1.ubuntu24_amd64.deb" --bootstrap cloud-hub --clients cloud-cli

cf-remote --version master install --bootstrap cloud-hub --hub cloud-hub
cf-remote --version master install --bootstrap cloud-hub --clients cloud-cli

# cfbs build
# cf-remote deploy --hub ubuntu
