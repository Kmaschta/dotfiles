#!/bin/bash
DIAG_SIZE="20 60"

if dialog --yesno "Install docker?" $DIAG_SIZE; then
  # Install docker-engine
  sudo apt install apt-transport-https ca-certificates
  sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
  echo deb https://apt.dockerproject.org/repo ubuntu-xenial main | sudo tee /etc/apt/sources.list.d/docker.list
  sudo apt update
  sudo apt purge lxc-docker
  sudo apt install docker-engine

  # Give permissions to use it
  sudo groupadd docker
  sudo usermod -aG docker $USER
fi

if dialog --yesno "Install atom?" $DIAG_SIZE; then
  ATOM_FILENAME="atom-amd64.deb"
  ATOM_VERSION="v1.9.9"
  EXPECTED_HASH="06195e558d3d6e7a6cc0c838d3fadf62"
  
  cd /tmp
  if [ ! -e $ATOM_FILENAME ]; then
    wget "https://atom-installer.github.com/$ATOM_VERSION/$ATOM_FILENAME"
  fi

  echo "$EXPECTED_HASH $ATOM_FILENAME" | md5sum -c -

  if [ $? -ne 0 ]; then
    echo "Hash for file $ATOM_FILENAME is invalid, expected: $EXPECTED_HASH"
    exit 1
  fi

  sudo apt install -y $SKYPE_DEPENDENCIES
  sudo dpkg -i $ATOM_FILENAME
  rm $ATOM_FILENAME
fi
