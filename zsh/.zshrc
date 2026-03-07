
#: alias {{{
alias vi='nvim'
alias l='ls'
alias ll='ls -l'
alias la='ls -al'
alias gs='git status'
alias h='history'
alias he='history -E'
alias hi='history -i'

#: }}}

#: Env var  {{{
export EDITOR=nvim
#: }}}

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt EXTENDED_HISTORY

# prefix history search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# keybind
bindkey -e
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^[f' forward-word
bindkey '^[b' backward-word


# zsh completion system 
autoload -Uz compinit
compinit

# fzf
source ~/.zsh-fzf-tab
bindkey '^I' fzf_completion

# pnpm
export PNPM_HOME="/home/puurun/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# OSC 133 markers for tmux/terminal prompt navigation
if [[ -n "$TMUX" ]]; then
  function _osc133_precmd() {
    printf '\e]133;D;%s\a' "$?"
    printf '\e]133;A\a'
  }

  function _osc133_preexec() {
    printf '\e]133;C\a'
  }

  autoload -Uz add-zsh-hook
  add-zsh-hook precmd _osc133_precmd
  add-zsh-hook preexec _osc133_preexec
fi


# Has to go to the end
eval "$(starship init zsh)"

