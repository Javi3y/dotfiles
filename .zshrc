# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/javier/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source "$HOME/.zsh/spaceship/spaceship.zsh"
source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh/venv.sh"
bindkey -s '^e' 'ranger^M'
bindkey -s '^t' 'tmux^M'
bindkey -s '^b' 'bpytop^M'
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANG='en_US.UTF-8'
export PATH="$PATH:$HOME/.local/bin"

alias vim="nvim"
alias svim="sudo nvim"
export VISUAL=nvim;
export EDITOR=nvim;
alias ls="exa --icons"
alias la="exa -a --icons"
alias ll="exa -l --icons"
alias lla="exa -la --icons"
alias lt="exa -l --tree --icons"
alias lta="exa -la --tree --icons"
alias k="kubectl"
function open () {
    nohup xdg-open "$*" &
}
#alias cat="pygmentize -g"
