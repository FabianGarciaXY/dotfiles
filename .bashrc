# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

################################## Start Blue Sh ##################################
[[ $- == *i* ]] && source ~/.local/share/blesh/ble.sh --attach=none
################################## End Blue Sh ##################################

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi

export EDITOR="/usr/local/share/neovim_11/bin/nvim -u /root/.config/nvim/min-init.vim"
export WORKSPACE="/home/$NAME/code/"
export JAVA_HOME=$JAVA_HOME:/root/.sdkman/candidates/java/current
export PATH=$PATH:/usr/local/share/neovim/bin:/root/.config/go_1_24/bin/:/root/.config/Hilbish/:$HOME/.local/bin/:/root/.sdkman/candidates/java/current/bin
. "$HOME/.cargo/env"
. "$HOME/.atuin/bin/env"

################### aliases ###################
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

################### Starship ###################
eval "$(starship init bash)"

################### OhMyPosh ###################
# eval "$(oh-my-posh init bash --config ~/.config/omp/extra_bubbles.omp.json)"
# eval "$(oh-my-posh init bash --config ~/.config/_shell.omp.json)"
# eval "$(oh-my-posh init bash --config ~/.config/amro.omp.json)"
# eval "$(oh-my-posh init bash --config ~/.config/bubbles.omp.json)"

################### Atuin ###################
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"

ble/util/import/eval-after-load core-complete '
  ble/array#remove _ble_complete_auto_source atuin-history'
################### Zoxide ###################
eval "$(zoxide init bash)"

################### SdkMan ###################
# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

. "$HOME/.local/bin/env"

################################## END LOGS ##################################
eval "$(mise activate bash)"

# pnpm
export PNPM_HOME="/root/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

################################## Start Blue Sh ##################################
[[ ! ${BLE_VERSION-} ]] || ble-attach
################################## End Blue Sh ##################################

bind 'TAB:menu-complete'
