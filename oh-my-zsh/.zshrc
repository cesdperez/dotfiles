export ZSH="$HOME"/.oh-my-zsh

ZSH_THEME="robbyrussell"
plugins=(git mvn archlinux)

source $ZSH/oh-my-zsh.sh

#############
## exports ##
#############

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export PATH="$PATH:$HOME/bin"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl'
fi

# NPM
export npm_config_prefix=~/.node_modules


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/opt/sdkman"
[[ -s "/opt/sdkman//bin/sdkman-init.sh" ]] && source "/opt/sdkman//bin/sdkman-init.sh"

#############
## aliases ##
#############

# Git
alias gcleann="git reset --hard HEAD && git clean -df"
alias gupom='git pull --rebase origin master'
