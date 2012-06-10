#!/usr/bin/env bash
if [[ $UID -ne 0 ]]; then
  echo "$0 must be run as root"
  exit 1
fi
echo "Installing programs we need to run puppet..."
apt-get install git-core ruby-dev rubygems
gem install hiera hiera-puppet hiera-gpg
echo "Getting and installing puppet..."
cd /tmp
curl -O http://ftp.uk.debian.org/debian/pool/main/p/puppet/puppet_2.7.14-1_all.deb
dpkg -i puppet_2.7.14-1_all.deb
echo "Generating ssh key..."
ssh-keygen
echo "Key generated. Please add this as a deploy key at https://github.com/timcowlishaw/Puppet/admin/keys, then press any key to continue."
cat /root/.ssh/id_rsa.pub
read -n 1 -s
echo "Checking out puppet config..."
git clone git@github.com:timcowlishaw/Puppet.git /etc/puppet
cd /etc/puppet
git submodule init
git submodule update
echo "Where is the puppet private key file? Either locally or available via SCP."
read private_key_location -prompt '> '
echo "Getting the puppet private keychain..."
scp -r $private_key_location /etc/puppet/hiera/keychains/private
chown -r root:root /etc/puppet/hiera/keychains/private
chmod 700 /etc/puppet/hiera/keychains/private
echo "About to do a test run of puppet. Watch for errors! Press a key to continue."
read -n 1 -s
puppet apply /etc/puppet/manifests/site.pp --noop --verbose
echo "DONE! Did everything go smoothly? Press any key to continue if so, or Ctrl-C to quit."
read -n 1 -s
puppet apply /etc/puppet/manifests/site.pp --verbose
echo "DONE! Finally, choose a password for user 'tim':"
passwd tim
echo "That's it - all finished."
