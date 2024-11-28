#!/bin/bash

cf-remote spawn --platform ubuntu-24 --name aws-hub --count 1 --role hub
cf-remote spawn --platform ubuntu-24 --name aws-ubu --count 1 --role client
cf-remote spawn --platform debian-12 --name aws-deb --count 1 --role client

sleep 30
 
cf-remote install --bootstrap aws-hub --hub     aws-hub --package "https://buildcache.cfengine.com/packages/testing-pr/jenkins-pr-pipeline-11441/PACKAGES_HUB_x86_64_linux_ubuntu_24/cfengine-nova-hub_3.24.1-1.ubuntu24_amd64.deb"
cf-remote install --bootstrap aws-hub --clients aws-ubu --package "https://buildcache.cfengine.com/packages/testing-pr/jenkins-pr-pipeline-11441/PACKAGES_x86_64_linux_ubuntu_24/cfengine-nova_3.24.1-1.ubuntu24_amd64.deb"
cf-remote install --bootstrap aws-hub --clients aws-deb --package "https://buildcache.cfengine.com/packages/testing-pr/jenkins-pr-pipeline-11441/PACKAGES_x86_64_linux_debian_12/cfengine-nova_3.24.1-1.debian12_amd64.deb"
