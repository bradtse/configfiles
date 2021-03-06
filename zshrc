# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   #export EDITOR='mvim'
   export EDITOR='vim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Used by agnoster theme to hide the username when logged in as the default user
DEFAULT_USER='brad'

# Makes dircolors use ~/.dircolors to determine colors used by 'ls'
if [ -f ~/.dircolors ]; then
    d=~/.dircolors
    test -r $d && eval "$(dircolors $d)"
fi


bash function function lazygit() {
    git add .
    git commit -a -m "$1"
    git push
}

local osname=$(uname) 2>/dev/null
if [ $osname = "Darwin" ]; then
    alias xtunnel='java -jar ~/xina_tunnel/xina_tunnel_console.jar ~/xina_tunnel/host_dev.properties ~/xina_tunnel/devel_dev.key root'
    alias xdown='cd ~/labcode/xina/xina_downloader/'
    alias devsim='cd ~/labcode/qt4/momadevsim/'
fi

alias svndiff='svn diff | vim -R -'

alias myip='curl ipecho.net/plain ; echo'
alias location='curl ipinfo.io/`myip`'

alias fix_shows='filebot -rename * -non-strict --db TheTVDB --format "{n} [{sxe}] {t}"'

bash function function hide() {
  CURR_DIR=`pwd -P`
  cd /etc/openvpn
  sudo openvpn Germany.ovpn 2>/dev/null &
  cd $CURR_DIR
}

bash function function tmode() {
  hide
  deluge-web -p 44000 &
}


