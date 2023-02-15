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
# Default aliases
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
alias mixci="mix format && mix credo && mix dialyzer && mix compile && mix test"


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
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
