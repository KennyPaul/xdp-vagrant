#!/bin/bash

if [[ "$USER" != "root" ]]; then
  echo "script must run as root"
  exit 1
fi

set -eux

export DEBIAN_FRONTEND=noninteractive

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D4284CDD
echo "deb [trusted=yes] http://52.8.15.63/apt trusty kernel" | tee /etc/apt/sources.list.d/iovisor.list
echo "deb [trusted=yes] http://52.8.15.63/apt/trusty trusty-nightly main" | tee -a /etc/apt/sources.list.d/iovisor.list

add-apt-repository -y ppa:ubuntu-lxc/lxd-stable

apt-get update
apt-get upgrade -y
