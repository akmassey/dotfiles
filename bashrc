source ~/.bash/aliases
source ~/.bash/completions
# source ~/.bash/mac
source ~/.bash/linux

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

# Setup Terminal prompt colors
GREEN="\[\033[01;32m\]"
BLUE="\[\033[01;34m\]"
YELLOW="\[\033[01;33m\]"
WHITE="\[\033[00m\]"

if [ "$SHELL" = '/bin/bash' ] || [ "$SHELL" = '/bin/sh' ]
then
	export PS1="$GREEN\u@\h $BLUE\W $YELLOW\$(parse_git_branch)\$(parse_svn_branch)$BLUE\$ $WHITE"
fi
