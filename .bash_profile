export PS1="\[\e[0m\][\[\e[36;1m\]\u \[\e[32;1m\]@ \[\e[33;1m\]\h\[\e[0m\]]\[\e[0m\][\[\e[34;1m\]\w\[\e[0m\]]\n$ "

# Adds colors to ls
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Make grep colorful
export GREP_OPTIONS='--color=auto'

export EDITOR=$(which vim)

# GRC
source "`brew --prefix`/etc/grc.bashrc"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
