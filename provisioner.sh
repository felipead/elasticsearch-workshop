#!/bin/bash

set -e


is_package_present() {
    PKG_OK=$(dpkg-query -W --showformat='${Status}\n' "$1" | grep "install ok installed")
    if [ "" = "$PKG_OK" ]; then
        return 1
    else
        return 0
    fi
}

install_package() {
    sudo apt-get install -y "$1"
}

install_java8() {
    if is_package_present oracle-java8-installer; then
        echo "Package oracle-java8-installer already installed"
    else
        sudo echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
        sudo echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
        sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
        sudo apt-get -y update
        sudo echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | tee /etc/oracle-java-8-licence-acceptance | /usr/bin/debconf-set-selections
        install_package oracle-java8-installer
    fi
}

install_elasticsearch() {
    if is_package_present elasticsearch; then
        echo "Package elasticsearch already installed"
    else
        wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
        echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list
        sudo apt-get -y update
        install_package elasticsearch
        sudo update-rc.d elasticsearch defaults 95 10
        sudo service elasticsearch restart
    fi
}

sudo apt-get -y update
install_java8
install_elasticsearch
