#!/bin/bash

cf-remote spawn --platform ubuntu-22-04-x64 --name ubuntu --count 1 --role hub
cf-remote spawn --platform windows-2016-x64 --name windows --count 1 --role client

sleep 60

cf-remote --version master install --demo --bootstrap ubuntu --hub ubuntu
cf-remote --version master install --demo --bootstrap ubuntu --clients windows

cfbs build
cf-remote deploy --hub ubuntu
