
#: alias
source ~/.zshrc.alias
export EDITOR=nvim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

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

# keybind
# bindkey -e
# bindkey '^A' beginning-of-line
# bindkey '^E' end-of-line
# bindkey '^[f' forward-word
# bindkey '^[b' backward-word
bindkey -v
bindkey '^R' history-incremental-search-backward

# Mac-style Word Movement (Insert Mode)
bindkey -M viins '^[[1;5D' vi-backward-word
bindkey -M viins '^[[1;5C' vi-forward-word

# Fix Backspace (sometimes vi-mode breaks it)
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

# prefix history search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search



# zsh completion system 
autoload -Uz compinit
compinit -C

# fzf
source ~/.zsh-fzf-tab
bindkey '^I' fzf_completion

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


# Local 
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Completions
source ~/.zshrc.completions


# Has to go to the end
eval "$(starship init zsh)"

