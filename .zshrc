# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Language
export LANG=en_US.utf8


# Ranger default editor
export VISUAL=nano
export EDITOR=nano
export EXPLORER=ranger
# Sxhkd
export SXHKD_SHELL=/bin/bash

# Rust
PATH=$PATH:$HOME/.cargo/bin
source "$HOME/.cargo/env"


#my scripts
SCRIPTS_HOME=$HOME/scripts
PATH=$SCRIPTS_HOME:$PATH

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
bindkey -e

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Default aliases
alias la='lsd -A'
alias l='lsd -CF'

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# My aliases
alias ll='lsd -alF'
alias ls='lsd'
alias tree='tree -C'
alias cat='bat'
alias feh='feh -Fd --draw-tinted'
alias open="xdg-open &>/dev/null"

alias bg="feh --bg-fill --randomize --recursive ~/.config/gtheme/wallpapers"
alias idea="idea.sh &>/dev/null & disown"
alias pulse="pulseUI &>/dev/null & disown"
alias pdf="zathura --fork"
alias dup="kitty . & disown"
alias c="code ."
alias ..="cd .."
alias ...="cd ../.."
#Git aliases
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gpl="git pull"
alias gm="git merge"
alias gst="git status"
alias gck="git checkout"
alias gd="git diff"
alias fgc="git add .;git commit -m 'fast committed';git push"

# Latex aliases
alias lclean="rm *.{aux,fdb*,fls*,log,sync*,out}"
# Screencast to mobile
alias mobile="scrcpy --tcpip=192.168.0.8:5555"

# Docker aliases
alias dps="docker ps"
alias dcu="docker compose up --build"
alias dcd="docker compose down"
alias dcl="docker compose logs"

# Cargo aliases

alias cr="cargo run"
alias cb="cargo build"
alias cc="cargo check"
alias ct="cargo test"

# Elixir aliases

alias mixt="mix test --max-failures 1"
alias mixcred="mix credo"
alias mixta="mix test"
alias mixc="mix compile"
alias mixd="mix deps.get"
alias mixr="mix run"
alias mixci="mix format && mix credo && mix dialyzer && mix compile && mix test --no-start"

# Mix
# REcord video
alias svgtopdf="inkscape --export-type=pdf"

#Calc function
calc(){ awk "BEGIN { print "$*" }"; }

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

#xset r rate 200 40

#Reports current power draw
power(){
	echo - | awk "{printf \"%.2f\", \
	$(( \
	  $(cat /sys/class/power_supply/BAT1/current_now) * \
	  $(cat /sys/class/power_supply/BAT1/voltage_now) \
	)) / 1000000000000 }" ; echo " W "
}


fpath=($HOME/.gtheme/completions $fpath)
autoload -Uz compinit && compinit

# Antidote plugin manager
ANTIDOTE_HOME=$HOME/.antidote
source $HOME/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load

export BREW_HOME=$HOME/homebrew
export PATH=$BREW_HOME/bin:$PATH
export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications --caskroom=$BREW_HOME/Caskroom"

# In order gpg to work
export GPG_TTY=$(tty)
