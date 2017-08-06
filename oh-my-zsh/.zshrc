export ZSH="$HOME"/.oh-my-zsh

ZSH_THEME="robbyrussell"
plugins=(git mvn archlinux)

source $ZSH/oh-my-zsh.sh

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
