#!/bin/bash

cf-remote spawn --platform ubuntu-22-04-arm64 --name ubuntu --count 1 --role hub
# cf-remote spawn --platform ubuntu-22-04-x64 --name client --count 1 --role client

for sec in {60..1}
do
    echo Waiting $sec seconds ...
    sleep 1
done

cf-remote install --package "https://buildcache.cfengine.com/packages/testing-pr/jenkins-pr-pipeline-10808/PACKAGES_HUB_arm_64_linux_ubuntu_24/cfengine-nova-hub_3.24.0a.fde419ddf~33268.ubuntu24_arm64.deb" --bootstrap ubuntu --hub ubuntu
# cf-remote install --package "https://buildcache.cfengine.com/packages/testing-pr/jenkins-pr-pipeline-10779/PACKAGES_x86_64_linux_ubuntu_22/cfengine-nova_3.24.0a.62f7a4d25~33169.ubuntu22_amd64.deb" --bootstrap ubuntu --clients client

# cfbs build
# cf-remote deploy --hub ubuntu
