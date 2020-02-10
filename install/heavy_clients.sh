#!/bin/bash
DIAG_SIZE="20 60"

if dialog --yesno "Install spotify?" $DIAG_SIZE; then
  sudo snap install spotify
fi

if dialog --yesno "Install chromium?" $DIAG_SIZE; then
  sudo snap install chromium
fi
