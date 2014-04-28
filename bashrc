#
# ~/.bashrc
#

export EDITOR="vim"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Setup for dotfiles
for file in $HOME/.scripts/*
do
  source $file
done
export PATH=$HOME/.bin:$PATH

# Rest of RC
source /etc/profile
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

if [[ -f "${SSH_ENV}" ]]
then
  . "${SSH_ENV}" > /dev/null
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_agent;
  }
else
 start_agent;
fi 

export PATH=$HOME/pi/x-tools/crosstool-ng/bin::$HOME/.gem/ruby/2.0.0/bin:$HOME/.gem/ruby/1.9.1/bin:$HOME/.shundle/bundle/shundle/bin:$PATH

export BROWSER=chromium
export GPGKEY=EF9D500139B01D89


export http_proxy=http://localhost:8123/
export https_proxy=$http_proxy
export ftp_proxy=$http_proxy
export rsync_proxy=$http_proxy
export no_proxy="localhost, 127.0.0.1"
[[ -f "/home/jeff/.config/autopackage/paths-bash" ]] && . "/home/jeff/.config/autopackage/paths-bash"

export CLOJURESCRIPT_HOME=$HOME/.bin/clojurescript
export PATH=$PATH:$CLOJURESCRIPT_HOME/bin
