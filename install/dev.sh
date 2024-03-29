#!/bin/bash
DIAG_SIZE="20 60"

if dialog --yesno "Install docker?" $DIAG_SIZE; then
  sudo apt remove docker docker-engine docker.io containerd runc
  sudo apt update
  sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo apt-key fingerprint 0EBFCD88
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo apt update
  sudo apt install docker-ce docker-ce-cli containerd.io

  # Give permissions to use it
  sudo usermod -aG docker $USER
fi

if dialog --yesno "Install node environment?" $DIAG_SIZE; then
  NVM_VERSION="v0.39.7"
  export PROFILE="$HOME/.console_profile"
  curl -o- "https://raw.githubusercontent.com/creationix/nvm/$NVM_VERSION/install.sh" | bash

  source ~/.zshrc
  nvm install 20
  nvm alias default 20
  nvm use default

  # Install commonly used node packages
  npm install -g diff-so-fancy 
fi

if dialog --yesno "Install yarn?" $DIAG_SIZE; then
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

  sudo apt update
  sudo apt install --no-install-recommends yarn
fi


if dialog --yesno "Install VS Code?" $DIAG_SIZE; then
  sudo snap install code --classic
fi
