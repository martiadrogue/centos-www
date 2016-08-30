# Centos WWW

Super fast a PHP Development box, the config is located in
[martiadrogue/puppet-master][repository-master].

CentOS 7 is setup to develop PHP applications with Apache and MySQL. Vagrant
provision with needed configuration to talk with puppet master.

## How to setup

-   Install vagrant using the [installation instructions][vagrant-installation]
-   Clone this repository and run `vagrant up`
-   Reboot the system if it's the first run `vagrant reload`
-   Put your php files inside the *www/* folder [know more][add-submodules]
-   Change remote's URL `git remote set-url origin https://github.com/vendor/environment`
-   Access `vagrant ssh` and enjoy!

## Included components

-   puppet agent
-   facter

## NOTES

To change machine's name edit *Vagrantfile*, *shell/hosts* and *shell/network*.

[vagrant-installation]: https://www.vagrantup.com/docs/installation/
[repository-master]: https://github.com/martiadrogue/puppet-master
[add-submodules]: www/README.md
