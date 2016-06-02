#!/bin/sh
sudo apt-get install git puppet
sudo puppet module install puppetlabs/vcsrepo
git clone https://github.com/AnselZhangGit/OliverZhang.git 
cd OliverZhang
sudo cp ./oliver /etc/puppet/modules/ -rf
REALNODE="$(cat /etc/hostname)"
sed -i "s/TEMPNODE/$REALNODE/g" ./init.pp
sudo puppet apply --verbose ./init.pp
