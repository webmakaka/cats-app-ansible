#!/usr/bin/env bash

apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get install -y ansible