# Created by newuser for 5.9
# Plugins
# zsh-autocomplete
#source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# zsh-autocomplete settings
#zstyle ':autocomplete:*' insert-unambiguous yes
#zstyle ':completion:*' completer _complete _complete:-fuzzy _correct _approximate _ignored
#bindkey              '^I'         menu-complete
#bindkey "$terminfo[kcbt]" reverse-menu-complete
# zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# spaceship
source "$HOME/.zsh/spaceship/spaceship.zsh"
# venv
source "$HOME/.zsh/venv.sh"
source <(fzf --zsh)
# aliases
alias k="kubectl"
alias c="clear"
alias vim="nvim"
alias svim="sudo nvim"
alias rm="rm -i"
alias ls="eza --icons=always"
alias la="eza -A --icons=always"
alias ll="eza -lh --icons=always"
alias lla="eza -lhA --icons=always"
alias lt="eza -h --tree --icons=always"
alias ltg="eza -h --tree --icons=always --git-ignore"
alias lta="eza -hA --tree --icons=always"
alias ltag="eza -hA --tree --icons=always --git-ignore"

alias ar="alembic revision -m"
alias ara="alembic revision --autogenerate -m"
alias auh="alembic upgrade head"

alias git-graph="git log --graph --oneline --decorate --all --branches --remotes"
alias gcb="git branch --show-current"
alias cd-git='cd "$(git rev-parse --show-toplevel)"'

function open(){
    nohup xdg-open $@ >/dev/null 2>&1 &
}



#binds
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

bindkey -r "^R"
bindkey -s "^R"   "ranger\n"
bindkey -r "^N"
bindkey -s "^N"   "nvim\n"
bindkey -r "^T"
bindkey -s "^T"   "tmux\n"

# opts
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_SPACE
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history 
unsetopt BEEP
# variables
export PATH="$HOME/.bin:$PATH"
export EDITOR=nvim
export MANPAGER="nvim +Man!"



autoload -Uz compinit
compinit


