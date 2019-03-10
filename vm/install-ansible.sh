#!/usr/bin/env bash

apt-add-repository -y ppa:ansible/ansible
apt update
apt install -y ansible