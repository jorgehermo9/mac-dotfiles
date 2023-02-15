# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

ANTIDOTE_HOME=$HOME/.antidote
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Suffix aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g .......='../../../../../..'

# Temporal aliases
alias cdd="cd $HOME_DIR/github/gtheme/desktops"
alias cdw="cd $HOME_DIR/github/gtheme/wallpapers"
alias cdt="cd $HOME_DIR/github/gtheme/themes"
alias cdg="cd $HOME_DIR/github/gtheme"
alias cdc="cd $HOME_DIR/.config/gtheme"

# Default aliases
alias la='gls -A'
alias l='gls -CF'
alias ls='gls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'

# Maven aliases
alias mvnc='mvn compile assembly:single'

# My aliases
alias ll='LC_COLLATE=C gls -alhF --group-directories-first'
alias tree='tree -C'
alias cat='bat'
alias catp='bat -p'
alias feh='feh -Fd --draw-tinted --conversion-timeout 5'
alias onesync='rclone sync -P OneDrive:Música/Canciones\ Hi-Res music'
alias xokas='firefox twitch.tv/elxokas &>/dev/null &; disown %1'
alias ttyc='tty-clock -c -s -b'
alias purge='sudo pacman -Rns $(pacman -Qdtq)'
alias bcat='/bin/cat'
alias pdf='zathura --fork'
alias dup='kitty . &; disown'
alias f='fuck'
alias du='du -d 1 -ha'
alias ell='exa -laF --icons --group-directories-first'
alias unimatrix='unimatrix -s 96 -f -l o'
alias r='ranger'
alias ncm='ncmpcpp'
alias c='code .'
alias rg='rg --hidden --no-ignore'
alias cpufetch='cpufetch --logo-intel-new'
alias df='df -h'

# Git aliases
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gb='git branch'
alias gco='git checkout'
alias gst='git status'
alias gpl='git pull'
alias fgc='git add .;git commit -m "Fast committed";git push'

# Docker aliases
alias dpsi='docker images'
alias dps='docker ps'
alias dst='docker stop $(docker ps -q)'
alias drm='docker rm $(docker ps -qa)'
alias dcu='docker compose up'
alias dcd='docker compose down'
alias dcl='docker compose logs -f'

# Cargo aliases
alias cb='cargo build'
alias cc='cargo check'
alias cr='cargo run -q'
alias ct='cargo test'

# Mix aliases
alias mixt='mix test --max-failures 1'
alias mixta='mix test'
alias mixdia='mix dialyzer'
alias mixcred='mix credo'
alias mixci='mix format && mix credo && mix dialyzer && mix test && mix compile'
alias mixc='mix compile'
alias mixd='mix deps.get'
alias mixclean='mix deps.clean --unused'

# Npm aliases
alias npi='npm install'
alias npd='npm run dev'

# Gtheme aliases
alias gt='gtheme theme apply'
alias gd='gtheme desktop apply'

# Work script
# [[ -r "$HOME_DIR/source-scripts/work.sh" ]] && source $HOME_DIR/source-scripts/work.sh

# Setting the keybindings for history substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Setting the correct key bindings
bindkey  "^[[H"    beginning-of-line
bindkey  "^[[F"    end-of-line
bindkey  "^[[3~"   delete-char
bindkey  "^[[1;3C" forward-word
bindkey  "^[[1;3D" backward-word

# Colored man pages
export LESS_TERMCAP_mb=$'\E[1;34m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;34m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;35m'    # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# Completions + gtheme
fpath=($HOME_DIR/.gtheme/completions $fpath)
autoload -Uz compinit && compinit -u
zstyle ':completion:*' menu select
