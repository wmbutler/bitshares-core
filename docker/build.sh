#!/bin/bash

# This file hold the instructions required to prepare the botshares-core repo for a proper
# Docker build. It will be used for building the docker image and is not required
# for anyone who is simply running the docker image

# Make sure sources are updated and master is chosen
git checkout master
git remote set-head origin --auto
git pull
git submodule sync --recursive
git submodule update --init --recursive

# Start docker build
docker build ../