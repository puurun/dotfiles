
#: Key bindings {{{

#: }}}

#: Env var  {{{
export EDITOR=nvim
#: }}}


# zsh completion system 
autoload -Uz compinit
compinit

# fzf
source ~/.zsh-fzf-tab
bindkey '^I' fzf_completion

# Has to go to the end
eval "$(starship init zsh)"
