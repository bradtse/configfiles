# User dependent .bashrc file
# See .bashrc.old for other potential changes

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour

# Some shortcuts for different directory listings
alias ls='ls -hF -G'                 # classify files in colour
alias ll='ls -laF'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -Fl'                              #

# Run sudo vim and skip creation of swap files
alias svim='sudo vim -n'

# User added changes
# alias gitr='cd /cygdrive/c/Users/brad/Documents/Programming/git'

# Makes dircolors use ~/.dircolors to determine colors used by 'ls'
# d=~/.dircolors
# test -r $d && eval "$(dircolors $d)"

# Python path
# Added this one because it was not being included in the default path for some
# reason
# export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages

###############################################################################
# Aliases for python virtual environments
###############################################################################

# No longer need these since of the activate trick
# alias dragon='source ~/dragon/bin/activate'
# alias activate-webserver='source ~/webserver-brad/bin/activate'

# Use distribute in any virtual environment
# export VIRTUALENV_DISTRIBUTE=true

# Use 256 color
# export TERM="xterm-256color"
export EDITOR=/usr/bin/vim

set -o vi

# Improved terminal prompt
export PS1="\u@\h[\w]$ "

# au BufRead,BufNewFile bash-fc-* set filetype=sh

# Used to config NASA env for python tools
if [ -f "~/config699/bash_config.sh" ]
then
    source ~/config699/bash_config.sh
fi

# As of now I am only using bash for work, so each time bash is used it will
# auto activate the py699 python virtualenv
if [ -f "~/virtualenvs/py699/bin/activate" ]
then
    source ~/virtualenvs/py699/bin/activate
fi

function activate() {
    source ~/virtualenvs/$1/bin/activate
}

#export PATH=$PATH:/Applications/NetBurner/pcbin

#export PATH=$PATH:/Applications/NetBurner/gcc-m68k/bin

#export NBROOT="/Applications/NetBurner"

#export NBROOTMINGW="/Applications/NetBurner"
