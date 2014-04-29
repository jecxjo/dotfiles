#
# ~/.bashrc
#

set -a
export EDITOR="vim"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Setup for dotfiles
for file in $HOME/.scripts/*
do
  source $file
done
export PATH=$PATH:$HOME/.bin

# Rest of RC
PS1='[\u@\h \W]\$ '

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
 echo "Initialising new SSH agent..."
 /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
 echo succeeded
 chmod 600 "${SSH_ENV}"
 . "${SSH_ENV}" > /dev/null
 /usr/bin/ssh-add;
}

# Source SSH settings, if applicable
function check_agent {
  if [[ -f "${SSH_ENV}" ]]
  then
    . "${SSH_ENV}" > /dev/null
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
      start_agent;
    }
  else
   start_agent;
  fi 
}

if [[ ! -e $HOME/.bashrc.local ]]
then
  cat > $HOME/.bashrc.local << EOF
# file: bashrc.local
#
# RC script for local machine. This is not tracked with dotfiles
# and should contain scripts that are specific to this machine.

# end of script
EOF
else
  source $HOME/.bashrc.local
fi
