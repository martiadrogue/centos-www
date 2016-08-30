# Description: This script install Puppet Agent, configures host to run with
# puppet and make a connetion with Pupept Master.
#
# NOTE: At the end of every command, you can see '> /dev/null'. This simply
# suppresses the output from the installation processes. If you would like to
# see the output when provisioning, simply remove it.
#
# To test host's changes execute:
# cat /etc/hosts
# cat /etc/hostname
# cat /etc/sysconfig/network
# puppet --version
# systemctl status iptables

# Config /etc/hosts
cat /vagrant/shell/etc/hosts > /etc/hosts
cat /vagrant/shell/etc/sysconfig/network > /etc/sysconfig/network

# Set up firewall
systemctl stop firewalld 2> /dev/null
systemctl mask firewalld 2> /dev/null
yum install -y iptables-services 2> /dev/null
systemctl enable iptables 2> /dev/null
iptables -A INPUT -p tcp -m state --state NEW --dport 8140 -j ACCEPT
service iptables save
systemctl start iptables 2> /dev/null

# Install puppet
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm 2> /dev/null
yum install -y puppet facter 2> /dev/null

# Fix vagrant synced_folder permission issue with apache. It's necessary restart
# to apreciate the changes at selinux.
cat /vagrant/shell/etc/selinux/config > /etc/selinux/config
