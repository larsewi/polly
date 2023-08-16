#!/bin/bash

cf-remote spawn --platform ubuntu-22-04-x64 --name ubuntu --count 1 --role hub
cf-remote spawn --platform windows-2016-x64 --name windows --count 1 --role client

sleep 60

# cf-remote --version master install --demo --bootstrap ubuntu --hub ubuntu
# cf-remote --version master install --demo --bootstrap ubuntu --clients windows

cf-remote install --package "http://buildcache.cfengine.com/packages/testing-pr/jenkins-pr-pipeline-9670/PACKAGES_HUB_x86_64_linux_ubuntu_20/cfengine-nova-hub_3.23.0a.186345f23~28238.ubuntu20_amd64.deb" --demo --bootstrap ubuntu --hub ubuntu
cf-remote install --package "http://buildcache.cfengine.com/packages/testing-pr/jenkins-pr-pipeline-9670/PACKAGES_i386_mingw/cfengine-nova-3.23.0a-28238-i686.msi" --demo --bootstrap ubuntu --clients windows

cfbs build
cf-remote deploy --hub ubuntu
