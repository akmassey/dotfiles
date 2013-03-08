# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="akmassey"
# ZSH_THEME="random"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler brew rbenv osx gem)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Source your Keychain.
if [ -x /usr/local/bin/keychain ]; then
  eval "$(keychain ~/.ssh/id_rsa)"
fi

# Display aliases.  Please see this post for more information:
#
# http://stackoverflow.com/questions/9299402/echo-all-aliases-in-zsh
_-accept-line () {
    emulate -L zsh
    local -a WORDS
    WORDS=( ${(z)BUFFER} )
    # Unfortunately ${${(z)BUFFER}[1]} works only for at least two words,
    # thus I had to use additional variable WORDS here.
    local -r FIRSTWORD=${WORDS[1]}
    local -r GREEN=$'\e[32m' RESET_COLORS=$'\e[0m'
    [[ "$(whence -w $FIRSTWORD 2>/dev/null)" == "${FIRSTWORD}: alias" ]] &&
        echo -nE $'\n'"${GREEN}Executing $(whence $FIRSTWORD)${RESET_COLORS}"
    zle .accept-line
}
zle -N accept-line _-accept-line


# A function to repeat a shell command a specified number of times.
#
# http://www.stefanoforenza.com/how-to-repeat-a-shell-command-n-times/
loop () {
    n=$1
    shift
    while [ $(( n -= 1 )) -ge 0 ]
    do
        "$@"
    done
}

# Starting to find auto correct rather annoying...
unsetopt correct_all

alias myfortune="fortune /Users/masseya/Documents/Fortunes/akm-quotes"
alias t="todo.sh -d ~/.todo.cfg"
alias recall="history | grep --color"
alias pg="ps aux | grep --color"
alias vanilla="/usr/bin/vim -u NONE -N" # alias for vim without customization
alias map="xargs -n1"

# list only dotfiles
alias l.='ls -lGd .*'

# use color with grep
alias grep='grep --color=auto'

# aliases for opening in various applications
alias skim="open -a Skim"
alias firefox="open -a Firefox"
alias safari="open -a Safari"
alias bibdesk="open -a BibDesk"

alias linode="ssh masseya@173.255.195.156 -p54"

# show recently changed files
alias lt="ls -lthGr"

# show / hide hidden files in the Mac OS X Finder
alias showhidden='defaults write com.apple.finder AppleShowAllFiles True; killall Finder'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles False; killall Finder'

myfortune

export EDITOR=/usr/bin/vim

# Oh My Zsh has a function defined for R, but I would rather use that for the
# statistical language package
# unfunction R


# rbenv configuration
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export RBENV_ROOT=/usr/local/opt/rbenv
