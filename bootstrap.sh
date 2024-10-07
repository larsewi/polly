#!/bin/bash

# Hub
cf-remote save --hosts vagrant@192.168.56.10 --role hub --name vagrant-hub
cf-remote install --bootstrap hub --hub vagrant-hub
# cf-remote install --package "https://buildcache.cfengine.com/packages/testing-pr/jenkins-pr-pipeline-10888/PACKAGES_HUB_x86_64_linux_ubuntu_22/cfengine-nova-hub_3.24.0a.f38177316~33542.ubuntu22_amd64.deb" --bootstrap hub --hub vagrant-hub

# cfbs build
# cf-remote deploy --hub vagrant-hub

# Client
# cf-remote save --hosts vagrant@192.168.56.11 --role client --name client
# cf-remote --version master install --demo --bootstrap hub --clients client
# cf-remote install --package "http://buildcache.cfengine.com/packages/testing-pr/jenkins-pr-pipeline-9562/PACKAGES_x86_64_linux_ubuntu_20/cfengine-nova_3.22.0-1.ubuntu20_amd64.deb" --demo --bootstrap hub --clients client

