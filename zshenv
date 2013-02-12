export PATH="$HOME/bin:$HOME/src/go/bin:/usr/local/lib/node_modules:/usr/texbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/X11/bin:$PATH"

# Prefer Homebrew stuff to the Mac defaults
export PATH="/usr/local/bin:$PATH"

# Ensure Python packages are in the path
export PATH="/usr/local/share/python:$PATH"

eval "$(rbenv init -)"
