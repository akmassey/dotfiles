Aaron Massey's Dot Files
========================

These are config files to set up a system the way I like it.  The idea
for this repository was shamelessly stolen from Ryan Bates.  The major
changes in my system are as follows:

* Added a `rake backup` command to back up your files prior to
  installation.  This is automatically performed when you call
  `rake install`.
* Added git submodules for various vim plugins that I use.  I frequently
  use both vim and TextMate, but I have begun going back to vim more
  often.   
* A git submodule for Robby Russell's oh-my-zsh.


Installation
------------

  git clone git://github.com/akmassey/dotfiles ~/.dotfiles
  cd ~/.dotfiles
  rake install


Environment
-----------

I am running on Mac OS X, but it will likely work on Linux as well with 
minor fiddling. I primarily use zsh, but this includes some older bash 
files as well. If you would like to switch to zsh, you can do so with 
the following command.

  chsh -s /bin/zsh


Features
--------

I normally place all of my coding projects in ~/code, so this directory 
can easily be accessed (and tab completed) with the "c" command.

  c railsca<tab>

There is also an "h" command which behaves similar, but acts on the 
home path.

  h doc<tab>

Tab completion is also added to rake and cap commands:

  rake db:mi<tab>
  cap de<tab>

To speed things up, the results are cached in local `.rake_tasks~` and 
`.cap_tasks~`. It is smart enough to expire the cache automatically in 
most cases, but you can simply remove the files to flush the cache.

There are a few key bindings set. Many of these require option to be
set as the meta key. Option-left/right arrow will move cursor by word, 
and control-left/right will move to beginning and end of line. 
Control-option-N will open a new tab with the current directory under
Mac OS X Terminal.

If you're using git, you'll notice the current branch name shows up in
the prompt while in a git repository.

If you're using Rails, you'll find some handy aliases (below). You can 
also use `show_log` and `hide_log` in script/console to show the log inline.
  
  ss       # script/server
  sc       # script/console
  sg       # script/generate
  a        # autotest
  tlog     # tail -f log/development.log
  rst      # touch tmp/restart.txt
  migrate  # rake db:migrate db:test:clone
  scaffold # script/generate `nifty_scaffold`

See the other aliases in ~/.zsh/aliases

If there are some shell configuration settings which you want secure or 
specific to one system, place it into a ~/.localrc file. This will be 
loaded automatically if it exists.

There are several features enabled in Ruby's irb including history and 
completion. Many convenience methods are added as well such as "ri"
which can be used to get inline documentation in IRB. See irbrc and
railsrc files for details.

TODO list for future improvements
=================================

Move all the stuff in your bashrc that's specific to Mac OS X to a separate
file that's included in the main file.


Setup zsh
---------

1. link zshrc
2. link zsh-theme file


Setup Janus
-----------

1. Setup your ~/.janus directory
2. remove the other vim plugins
