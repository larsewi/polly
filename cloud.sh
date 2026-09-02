#!/bin/bash

# eval "$(aws configure export-credentials --format env)"

cf-remote spawn --platform ubuntu-26 --name hub --count 1 --role hub
cf-remote spawn --platform debian-13 --name debian --count 1 --role client
cf-remote spawn --platform rhel-10 --name redhat --count 1 --role client

cf-remote install --demo --bootstrap hub --hub hub
cf-remote install --bootstrap hub --clients debian,redhat

