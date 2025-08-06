#!/bin/bash

cf-remote spawn --platform ubuntu-24 --name aws-hub --count 1 --role hub
cf-remote spawn --platform debian-12 --name aws-deb --count 1 --role client

sleep 30

for host in "aws-hub aws-cli"; do
    cf-remote run  --hosts "$host" 'echo "set -o vi" >> .bashrc'
    cf-remote run  --hosts "$host" 'echo "export VISUAL=vim" >> .bashrc'
    cf-remote run  --hosts "$host" 'echo "export EDITOR=vim" >> .bashrc'
    cf-remote sudo --hosts "$host" 'echo "set -o vi" >> .bashrc'
    cf-remote sudo --hosts "$host" 'echo "export VISUAL=vim" >> .bashrc'
    cf-remote sudo --hosts "$host" 'echo "export EDITOR=vim" >> .bashrc'

exit 0

cf-remote --version master install --bootstrap aws-hub --hub     aws-hub
cf-remote --version master install --bootstrap aws-hub --clients aws-deb

