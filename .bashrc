alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CFlh'
alias lsd="ls -alF | grep /%"

PATH=$PATH:$HOME/bin:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Extract script from StackOverflow
function extract() {
   if [ $# -ne 1 ]; then
       echo "Usage: extract <archive>"
       return 
   fi
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "Can't extract: '$1'" ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

function up() {
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

function fawk {
    eval "awk '{print \$${1}}'"
}

function svnn {
    svn st | grep "^?" | fawk 2
}

function all {
    if [ $# -lt 1 ]
    then
        echo "Usage: all {args}"
        return 65
    fi

    for dir in $(find . -type d -maxdepth 1 -mindepth 1); do
        echo "Evaluating '$@' in $dir"
        cd $dir && eval $@ && cd ..
    done
}
