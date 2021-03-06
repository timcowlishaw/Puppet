#!/usr/bin/env bash
if [[ $UID -ne 0 ]]; then
  echo "$0 must be run as root"
  exit 1
fi
echo "Installing programs we need to run puppet..."
apt-get install git-core ruby1.8-dev rubygems1.8 ruby1.8 curl -y
gem install hiera hiera-puppet hiera-gpg
echo "Getting and installing puppet..."
cd /tmp
curl -O http://ftp.uk.debian.org/debian/pool/main/p/puppet/puppet-common_2.7.17-1_all.deb
curl -O http://ftp.uk.debian.org/debian/pool/main/p/puppet/puppet_2.7.17-1_all.deb
dpkg -i puppet-common_2.7.17-1_all.deb
dpkg -i puppet_2.7.17-1_all.deb
apt-get -f install -y
if [ ! -f /root/.ssh/id_rsa ]
then
  echo "Generating ssh key..."
  ssh-keygen -N '' -f /root/.ssh/id_rsa
fi
echo "Please add this machine's key as a deploy key at https://github.com/timcowlishaw/Puppet/admin/keys, then press any key to continue."
cat /root/.ssh/id_rsa.pub
read -n 1 -s
echo "Checking out puppet config..."
rm -rf /etc/puppet
git clone git@github.com:timcowlishaw/Puppet.git /etc/puppet
cd /etc/puppet
git submodule init
git submodule update
mkdir /etc/puppet/files
echo "Where is the puppet private key file? Either locally or available via SCP."
read private_key_location
echo "Getting the puppet private keyring..."
scp -r $private_key_location /etc/puppet/hiera/keyrings/private
chown -R root:root /etc/puppet/hiera/keyrings/private
chmod 700 /etc/puppet/hiera/keyrings/private
echo "About to do a test run of puppet. Watch for errors! Press a key to continue."
read -n 1 -s
puppet apply /etc/puppet/manifests/site.pp --noop --verbose
echo "DONE! Did everything go smoothly? Press any key to continue if so, or Ctrl-C to quit."
read -n 1 -s
puppet apply /etc/puppet/manifests/site.pp --verbose
echo "DONE! Finally, choose a password for user 'tim':"
passwd tim
echo "That's it - all finished."
