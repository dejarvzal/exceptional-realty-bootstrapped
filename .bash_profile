stty -ixon

if [ -e code ]; then
  cd code
fi

rvm_silence_path_mismatch_check_flag=1

bind "set completion-ignore-case on"

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function prompt {
  local   RED="\[\033[0;31m\]"
  local   CHAR="♥"
  local   BLUE="\[\e[0;49;34m\]"

  export PS1="\[\e]2;\u@\h\a[\e[37;44;1m\]\t\[\e[0m\]]$RED\$(parse_git_branch) \[\e[32m\]\W\[\e[0m\]\n\[\e[0;31m\]$BLUE//$RED $CHAR \[\e[0m\]"
  export PS2='> '
  export PS4='+ '
}

prompt

#if [ -f $HOME/.login_addr ]; then
#  addr=$(cat $HOME/.login_addr)

#  if [[ -n "$addr" ]]; then
#    ip=$(cat $HOME/.login_addr)
#    tz=$(tzupdate -p -a ${ip})

#    if [[ $tz =~ 'Detected timezone is' ]]; then
#      fmt_tz=$(echo $tz | awk '{ print $4 }' | sed 's/.$//')

#      export TZ="/usr/share/zoneinfo/$fmt_tz"
#    fi
#  fi
#fi

if [ ! -f $HOME/.logged_in ]; then
  echo "Welcome to the Learn IDE! You're all set."
  echo "Go back to Learn in your browser to get started."
  touch $HOME/.logged_in
fi

export PATH=/var/opt/rails/bin:/var/opt/httpserver/bin:/var/opt/atom/bin:/var/opt/shotgun/bin:/var/opt/rackup/bin:$PATH
