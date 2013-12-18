# -*- mode: ruby -*-
# vi: set ft=ruby :

package = ENV.fetch("PACKAGE", "nellie")
setup = <<-SETUP
JRUBY_VERSION=1.7.8
#{"export http_proxy=#{ENV['http_proxy']}" if ENV['http_proxy']}

apt-get update -y
apt-get install -yq git openjdk-7-jdk

if [ ! -f /tmp/jruby-bin-$JRUBY_VERSION.tar.gz ] ; then
  echo "---> Downloading JRuby $JRUBY_VERSION"
  wget -O /tmp/jruby-bin-$JRUBY_VERSION.tar.gz \
    http://jruby.org.s3.amazonaws.com/downloads/$JRUBY_VERSION/jruby-bin-$JRUBY_VERSION.tar.gz
  echo "---> Extracting JRuby tarball"
  tar xfz /tmp/jruby-bin-$JRUBY_VERSION.tar.gz -C /opt
fi

cat <<_EOF_ > /etc/profile.d/00_path.sh
export PATH=/opt/jruby-$JRUBY_VERSION/bin:$PATH
_EOF_
chmod 755 /etc/profile.d/00_path.sh

source /etc/profile.d/00_path.sh

if ! command -v bundle >/dev/null ; then
  gem install bundler
fi

sudo -i -H -u vagrant bash -c '
cd /vagrant; \
bundle install; \
if [ ! -f /vagrant/lib/java/jruby-complete.jar ] ; then \
  bundle exec make-package jrubyjar; \
fi; \
bundle exec make-package clean;
'

echo
echo
echo "---> Node preparation complete. To finish the build:
echo "     * vagrant ssh"
echo "     * cd /vagrant"
echo "     * bundle exec make-package build #{package} --gemfile gemfiles/#{package} --verbose"
echo
SETUP

Vagrant.configure("2") do |config|
  config.vm.box = "opscode-ubuntu-12.04"
  config.vm.provision :shell, :inline => setup
  config.ssh.forward_agent = true

  config.vm.provider "virtualbox" do |p|
    p.customize ["modifyvm", :id, "--memory", "3072"]
  end

  config.vm.provider "vmware_fusion" do |p|
    p.vmx["memsize"] = "3072"
  end
end
