#!/bin/bash

cf-remote spawn --platform debian-12 --name aws-hub --count 1 --role hub
cf-remote spawn --platform debian-12 --name aws-cli --count 1 --role client

sleep 30

cf-remote install --demo --package "https://buildcache.cfengine.com/packages/testing-pr/jenkins-pr-pipeline-12963/PACKAGES_HUB_x86_64_linux_debian_12/cfengine-nova-hub_3.21.8-1.debian12_amd64.deb" --bootstrap aws-hub --hub     aws-hub
cf-remote install --package "https://buildcache.cfengine.com/packages/testing-pr/jenkins-pr-pipeline-12963/PACKAGES_x86_64_linux_debian_12/cfengine-nova_3.21.8-1.debian12_amd64.deb" --bootstrap aws-hub --clients aws-cli

