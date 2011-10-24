source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi


# .bashrc

# This file is sourced by all bash shells on startup, whether interactive
# or not.  This file *should generate no output* or it will break the
# scp and rcp commands.

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Application Specific
alias myfortune="fortune /opt/local/share/games/fortune/akm-quotes"
alias t="todo.sh -d ~/.todo.cfg"

# MacPorts Settings
alias start_mysql="/Library/StartupItems/MySQLCOM/MySQLCOM start"
alias stop_mysql="/Library/StartupItems/MySQLCOM/MySQLCOM stop"

# VIM Settings
alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
export VIM_APP_DIR="/Applications"
export VIMRUNTIME="/Applications/MacVim.app/Contents/Resources/vim/runtime/"

export JAVA_HOME="/Library/Java/Home"
export CATALINA_HOME="/Library/Tomcat/Home"
#export ANT_HOME="

# Mac OS X specific
alias mute='sudo osascript -e "set Volume 0"'
alias max='sudo osascript -e "set Volume 10"'

export EDITOR="/Applications/MacVim.app/Contents/MacOS/Vim"
export DISPLAY=":0.0"
export PATH="/Users/masseya/bin:/usr/texbin:/usr/local/bin:/usr/local/mysql/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:/Users/masseya/.gem/ruby/1.8/bin:$PATH"
export MANPATH="/opt/local/share/man:$MANPATH"

export HTML_TIDY="~/.htmltidyrc"

# Rails Exports
export AUTOFEATURE=true
export RSPEC=true
#export RUBYOPT="rubygems"
#export RI="--format ansi --width 70"

# Go Language
export GOROOT="/Users/masseya/src/golang/"
export GOOS="darwin"
export GOARCH="amd64"

# iTerm Title
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/#$HOME/~}\007"'

# Setup Terminal prompt colors
GREEN="\[\033[01;32m\]"
BLUE="\[\033[01;34m\]"
YELLOW="\[\033[01;33m\]"
WHITE="\[\033[00m\]"

if [ "$SHELL" = '/bin/bash' ] || [ "$SHELL" = '/bin/sh' ]
then
	export PS1="$GREEN\u@\h $BLUE\W $YELLOW\$(parse_git_branch)\$(parse_svn_branch)$BLUE\$ $WHITE"
fi

# This loads RVM into a shell session.
[[ -s "/Users/masseya/.rvm/scripts/rvm" ]] && source "/Users/masseya/.rvm/scripts/rvm"

