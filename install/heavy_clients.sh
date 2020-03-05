#!/bin/bash
DIAG_SIZE="20 60"

if dialog --yesno "Install spotify?" $DIAG_SIZE; then
  sudo snap install spotify
fi

if dialog --yesno "Install chromium?" $DIAG_SIZE; then
  sudo snap install chromium
fi

if dialog --yesno "Install slack?" $DIAG_SIZE; then
  sudo snap install slack --classic
fi

if dialog --yesno "Install DBeaver?" $DIAG_SIZE; then
  sudo snap install dbeaver-ce
fi
