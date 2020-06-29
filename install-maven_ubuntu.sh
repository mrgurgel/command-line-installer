#!/bin/bash

MVN_VERSION=3.6.3

function create_directories() {
  echo "Creating directory structure"
  mkdir -p ~/.m2/install
}

function download_and_settle_maven() {
  echo "Download and unpack maven"
  wget http://mirror.nbtelecom.com.br/apache/maven/maven-3/${MVN_VERSION}/binaries/apache-maven-${MVN_VERSION}-bin.tar.gz -P ~/.m2
  tar xzvf ~/.m2/apache-maven-${MVN_VERSION}-bin.tar.gz -C ~/.m2/install
  chmod +x ~/.m2/install/apache-maven-${MVN_VERSION}/bin/mvn
  echo "Removing the downloaded gz"
  rm ~/.m2/apache-maven-${MVN_VERSION}-bin.tar.gz
}

function register_binary_in_classpath() {
  echo "ROOT access needed for update-alternatives: Setting maven in the current classpath"
  sudo update-alternatives --install /usr/bin/mvn mvn ~/.m2/install/apache-maven-${MVN_VERSION}/bin/mvn 21
}

create_directories
download_and_settle_maven
register_binary_in_classpath

