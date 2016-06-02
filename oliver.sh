#!/bin/sh
sudo apt-get -y update
sudo apt-get -y install git puppet
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
sudo puppet module install puppetlabs/vcsrepo
puppet module install ploperations-bundler
git clone https://github.com/AnselZhangGit/OliverZhang.git 
cd OliverZhang
sudo cp ./oliver /etc/puppet/modules/ -rf
REALNODE="$(cat /etc/hostname)"
sed -i "s/TEMPNODE/$REALNODE/g" ./init.pp
sudo puppet apply --verbose ./init.pp
