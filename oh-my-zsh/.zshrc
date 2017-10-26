export ZSH=/opt/oh-my-zsh

ZSH_THEME="robbyrussell"
plugins=(git mvn archlinux)

source $ZSH/oh-my-zsh.sh

#############
## exports ##
#############

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export PATH="$PATH:/opt/bin:$HOME/bin"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl'
fi

##Postgres
export PGDATA="/opt/postgresql-9.4/data"
export PGRAMDATA="/opt/postgresql-9.4/data_tmpfs"
export PGPASSWORD="postgres"

##Tomcat
export CATALINA_HOME="/opt/apache-tomcat-7"
export CATALINA_BASE="$CATALINA_HOME"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/opt/sdkman"
[[ -s "/opt/sdkman//bin/sdkman-init.sh" ]] && source "/opt/sdkman//bin/sdkman-init.sh"

#############
## aliases ##
#############

alias pgctl="pg_ctl"
alias pgramctl="pg_ctl -D $PGRAMDATA"

# Intellij IDEA projects
alias ienact="idea /opt/projects/enact &"
alias itpp="idea /opt/projects/enact-tpp &"
alias ipreserve="idea /opt/projects/preserve &"
alias iaccount="idea /opt/projects/account/server/pom.xml &"
alias iinventory="idea /opt/projects/inventory-hub &"

# Git
alias gcleann="git reset --hard HEAD && git clean -df"
alias gupom='git pull --rebase origin master'

# Docker
## Kill all running containers.
alias dockerkillall='docker kill $(docker ps -q)'
## Delete all stopped containers.
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'
## Delete all untagged images.
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'
## Delete all stopped containers and untagged images.
alias dockerclean='dockercleanc || true && dockercleani'

# AWS
function aws-ip() {
  aws-info $1 $2 | cut -f1
}

function aws-info() {
  profile=${2-default}
  aws ec2 --profile $profile describe-instances \
    --filters Name=tag:Name,Values=$1 \
    --query 'Reservations[].Instances[].[PrivateIpAddress,InstanceId,Tags[?Key==`Name`].Value[]]' \
    --output text | sed '$!N;s/\n/ /'
}