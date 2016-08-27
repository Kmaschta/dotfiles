#!/bin/bash
DIR="$HOME/.dotfiles"
DIAG_SIZE="20 60"

CONSOLE_COMPONENTS="zsh rxvt-unicode-256color htop curl wget xsel ncdu xtrlock"

if dialog --yesno "Install console components?\n\n$CONSOLE_COMPONENTS" $DIAG_SIZE; then
  echo "Install dependencies"
  sudo apt install -y $CONSOLE_COMPONENTS

  # urxvt
  echo "Install urxvt config files"
  ln -svi "$DIR/.Xdefaults" $HOME && chmod +r "$DIR/.Xdefaults"
  ln -svi "$DIR/.urxvt" $HOME && chmod +r "$DIR/.urxvt" -R

  # env variables
  echo "Installing environment variables"
  ln -svi "$DIR/.env" $HOME

  # aliases
  echo "Installing aliases"
  ln -svi "$DIR/.aliases" $HOME

  # Bash logs
  echo "Installing bash logs"
  mkdir -vp "$HOME/.logs"
  ln -svi "$DIR/.bash_logs" $HOME

  # Profile
  echo "Installing profile"
  cp -i "$DIR/.console_profile.dist" "$DIR/.console_profile"
  ln -svi "$DIR/.console_profile" $HOME

  # zsh
  echo "Install ZSH and set it as default shell"
  wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | bash
  rm -vf "$HOME/.zshrc" && ln -svi "$DIR/.zshrc" $HOME
  chsh -s /usr/bin/zsh $USER
fi

if dialog --yesno "Install vim?" $DIAG_SIZE; then
  echo "Install dependencies"
  sudo apt install vim

  echo "Install vim config files"
  ln -svi "$DIR/.vimrc" $HOME
  ln -svi "$DIR/.vim" $HOME

  echo "Install plugin"
  vim +PluginInstall +qall
fi

if dialog --yesno "Logout session?\n\nIt is strongly recommanded in order to reset shell config." $DIAG_SIZE; then
  gnome-session-quit --no-prompt
fi
