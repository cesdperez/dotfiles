export ZSH="$HOME"/.oh-my-zsh

ZSH_THEME="robbyrussell"
plugins=(git mvn archlinux aws)

source $ZSH/oh-my-zsh.sh

#############
## exports ##
#############

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export PATH="$PATH:$HOME/bin:$HOME/.node_modules/bin"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code'
fi

# NPM
export npm_config_prefix=~/.node_modules


# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

#############
## aliases ##
#############

# Git
alias gcleann="git reset --hard HEAD && git clean -df"
alias gupom='git pull --rebase origin master'

# Docker
alias dkillall='docker kill $(docker ps -q)'
alias dcleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'
alias dcleani='printf "\n>>> Deleting dangling images\n\n" && docker rmi $(docker images -q -f dangling=true)'
alias dcleanv='printf "\n>>> Deleting dangling volumes\n\n" && docker volume rm $(docker volume ls -qf dangling=true)'
alias dclean='dcleanc || true && dcleani || true && dcleanv'
