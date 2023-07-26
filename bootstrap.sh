#!/bin/bash

# Hub
cf-remote save --hosts vagrant@192.168.56.10 --role hub --name hub
cf-remote --version master install --demo --bootstrap hub --hub hub
# cf-remote install --package "http://buildcache.cfengine.com/packages/testing-pr/jenkins-pr-pipeline-9562/PACKAGES_HUB_x86_64_linux_ubuntu_22/cfengine-nova-hub_3.22.0-1.ubuntu22_amd64.deb" --demo --bootstrap hub --hub hub
cfbs build
cf-remote deploy --hub hub

# Client
# cf-remote save --hosts vagrant@192.168.56.11 --role client --name client
# cf-remote --version master install --demo --bootstrap hub --clients client
# cf-remote install --package "http://buildcache.cfengine.com/packages/testing-pr/jenkins-pr-pipeline-9562/PACKAGES_x86_64_linux_ubuntu_20/cfengine-nova_3.22.0-1.ubuntu20_amd64.deb" --demo --bootstrap hub --clients client

