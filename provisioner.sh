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

install_package_if_not_present() {
    if is_package_present "$1" -eq 0; then
        echo "Package $1 already installed"
    else
        sudo apt-get install -y "$1"
    fi
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
        install_package_if_not_present oracle-java8-installer
    fi
}

sudo apt-get -y update
install_java8

