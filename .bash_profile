export EDITOR=$(which vim)
export JMX_PORT=1099
export MAVEN_OPTS="-Xmx2048m"
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export CLICOLOR=1

export PS1="\[\e[0m\][\[\e[32;1m\]\u \[\e[33;1m\]@ \[\e[31;1m\]\h\[\e[0m\]]\[\e[0m\][\[\e[36;1m\]\w\[\e[0m\]]\n\[\e[0m\]$ "

source "$(brew --prefix)/etc/grc.bashrc"
export http_proxy="http://connsvr.nike.com:8080"
export HTTP_PROXY=$http_proxy
export https_proxy="https://connsvr.nike.com:8080"
export HTTPS_PROXY=$https_proxy
export no_proxy='localhost,127.0.0.0/8,local.home,.nike.com,nikevm'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
