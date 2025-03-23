
echo "Starting zsh config..."

########################################### INIT ENVS  ##########################################
export ZDOTDIR="$XDG_CONFIG_HOME/"
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file
export EDITOR="nvim"
export VISUAL="nvim"

export XDG_CONFIG_HOME="$HOME"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export WORKSPACE="/home/$NAME/code/"
export JAVA_HOME="$JAVA_HOME:/root/.sdkman/candidates/java/current"
export PATH="$PATH:/usr/local/share/neovim/bin:/root/.config/go_1_24/bin/:/root/.config/Hilbish/:$HOME/.local/bin/:/root/.sdkman/candidates/java/current/bin"
. "$HOME/.cargo/env"
. "$HOME/.atuin/bin/env"
. "$HOME/.local/bin/env"
###########################################   END ENVS   #########################################

########################################### INIT ALIASES #########################################
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gpo='git push origin'
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
alias gr='git branch -r'
alias gplo='git pull origin'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias gl='git log'
alias gr='git remote'
alias grs='git remote show'
alias glo='git log --pretty="oneline"'
alias glol='git log --graph --oneline --decorate'
alias lzd='lazydocker'
alias lzg='lazygit'
alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias components="git --git-dir=${WORKSPACE}arkon-workflows-components/.git --work-tree=${WORKSPACE}arkon-workflows-components"
alias workflows="git --git-dir=${WORKSPACE}arkon-workflows/.git --work-tree=${WORKSPACE}arkon-workflows"
alias process="git --git-dir=${WORKSPACE}arkon-business_processes/.git --work-tree=${WORKSPACE}arkon-business_processes"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias neovide="/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command 'neovide --wsl --neovim-bin /usr/local/share/neovim/bin/nvim'"
alias min-neovim="/usr/local/share/neovim_11/bin/nvim -u /root/.config/nvim/min-init.vim"
alias c="clear"
alias cls="clear"
########################################### END ALIASES ###########################################

###########################################  INIT OPTS  ###########################################
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
unsetopt HIST_SAVE_NO_DUPS       # Write a duplicate event to the history file
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files
###########################################  END OPTS   ###########################################

########################################### INIT CONFIGS ##########################################
# Zsh plugin
eval "$(starship init zsh)"

# Better cd
eval "$(zoxide init zsh)"

# Shell history utility
[[ -f $HOME/.bash-preexec.sh ]] && source $HOME/.bash-preexec.sh
eval "$(atuin init zsh)"

# JVM manager
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
. "$HOME/.local/bin/env"
########################################### END CONFIGS  ##########################################

echo "Zsh config done!"

