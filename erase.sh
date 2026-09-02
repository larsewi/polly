#!/bin/bash

for host in hub debian redhat; do
  cf-remote sudo --hosts $host "systemctl stop cfengine3"
  case "$host" in
  hub)
    cf-remote sudo --hosts $host "apt purge -y cfengine-nova-hub";;
  redhat)
    cf-remote sudo --hosts $host "dnf remove -y cfengine-nova";;
  debian)
    cf-remote sudo --hosts $host "apt purge -y cfengine-nova";;
  esac
  cf-remote sudo --hosts $host "rm -rf /var/cfengine/"
  cf-remote sudo --hosts $host "rm -rf /opt/cfengine/"
  cf-remote sudo --hosts $host "rm -rf /var/log/CFEngine-Install*log"
  cf-remote sudo --hosts $host "rm -rf /var/log/postgresql.log"
done

