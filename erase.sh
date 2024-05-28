#!/bin/bash

cf-remote save --hosts vagrant@192.168.56.10 --role hub --name vagrant-hub
cf-remote run --hosts vagrant-hub "sudo systemctl stop cfengine3"
cf-remote run --hosts vagrant-hub "sudo apt remove -y cfengine-nova-hub"
cf-remote run --hosts vagrant-hub "sudo rm -rf /var/cfengine/"
cf-remote run --hosts vagrant-hub "sudo rm -rf /opt/cfengine/"
cf-remote run --hosts vagrant-hub "sudo rm -rf /var/log/CFEngine-Install.log"
cf-remote run --hosts vagrant-hub "sudo rm -rf /var/log/postgresql.log"

