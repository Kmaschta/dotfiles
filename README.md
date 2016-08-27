The principal goal of this repository is to install and configure a workstation without spending four hours to its installation.
I maintain my multiple configurations here as well.

It was only created to run with Ubuntu 16.04 or Ubuntu GNOME 16.04.
Feel free to take a look, fork or reuse at your own risk!

# Install
```bash
sudo apt install git
git clone git@github.com:Kmaschta/dotfiles.git ~/.dotfiles
make install
```

For each step of the installation you might be asked if you want to install the component with `dialog --yesno`.

![prompt](/doc/prompt.png)

## Console
`make install-console`

The minimum viable console is for me: `rxvt-unicode` and `zsh` with few aliases, environment variables, and profiles.
`vim`, my favorite editor, is installed and used by default thanks to the `EDITOR` environment variable.

At the end of this install, you might be asked to logout your gnome session in order to take on board the `chsh` update.

#### uRXVT, ZSH and stuff

```bash
~
├── .aliases            # Aliases list
├── .bash_logs          # Log all your bash commands in ~/.logs/ in a greppable format
├── .console_profile    # Centralize all that you need at the console run (zsh source this file)
├── .env                # Environment variables
├── .logs/
├── .oh-my-zsh/         # ZSH git repo
├── .urxvt/             # uRXVT extensions (clipboard, etc)
├── .Xdefaults          # uRXVT configuration
└── .zshrc              # ZSH configuration
```

#### VIM
Type `:q!` and `Enter` to exit. If it do not works: spam `Ctrl+C` then, repeat the first instruction.
Otherwise, you're doomed for ever.

I only write **Python** or **Markdown** with vim, so this config is principally oriented to fill pythonist or writer needs.

```bash
~                             
├── .vim
│   ├── bundle
│   ├── colors
│   ├── indent
├── .vimrc
```

## Development
`make install-dev`

For now this is the list of binary that I install with this command:

| **Software**                            | **Installation method** | **Version** |
|-----------------------------------------|-------------------------|-------------|
| [Docker](https://www.docker.com/)       | APT repository          | Latest      |
| [Atom](https://atom.io/)                | .deb direct download    | 1.9.9       |
| [NVM](https://github.com/creationix/nvm)| Installer download      | 0.31.6      |

For each download, the script check the md5 hash of the file before install it.


## Heavy clients
`make install-heavy-clients`

Since Skype and Spotify are NECESSARY to work these days, there are a part of my install.

| **Software**                            | **Installation method** | **Version** |
|-----------------------------------------|-------------------------|-------------|
| [Spotify](https://www.spotify.com/)     | APT repository          | Latest      |
| [Skype](https://www.skype.com/)         | .deb direct download    | 4.3         |

Again, the script check the md5 hash and throw an error if needed.
The Skype version can appear to be outdated and ugly, but it is the latest version supported on linux.
