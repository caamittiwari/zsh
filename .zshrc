
#!/usr/bin/sh
zmodload zsh/zprof
export ZDOTDIR=$HOME/.config/zsh 
HISTFILE=~/.zsh_history
setopt appendhistory
export DISPLAY=:0 # XWING Server
# set clipboard=unnamedplus
# Flex on the ubuntu users
# neofetch

# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP 


# completions
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.

# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# Add on file with .zshrc
#"zsh-prompt"
zsh_add_file=( "zsh-functions" "zsh-exports" "zsh-prompt"  "zsh-aliases" "zsh-vim-mode")
for file in "${zsh_add_file[@]}" 
do
  source "$ZDOTDIR/$file" 
done  


# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_plugin "zsh-users/zsh-completions"
zsh_add_plugin "hcgraf/zsh-sudo"
zsh_add_plugin "Yabanahano/web-search"
zsh_add_plugin "agkozak/zsh-z"
zsh_add_plugin "romkatv/powerlevel10k"


zsh_add_completion "esc/conda-zsh-completion" false
# For more plugins: https://github.com/unixorn/awesome-zsh-plugins
# More completions https://github.com/zsh-users/zsh-completions

# Key-bindings
bindkey -s '^o' 'ranger^M'
bindkey -s '^f' 'zi^M'
bindkey -s '^s' 'ncdu^M'
# bindkey -s '^n' 'nvim $(fzf)^M'
# bindkey -s '^v' 'nvim\n'
bindkey -s '^z' 'zi^M'
bindkey '^[[P' delete-char
bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down
bindkey -r "^u"
bindkey -r "^d"

# FZF
# TODO update for mac
# [ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
# [ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
# [ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
# [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# [ -f $ZDOTDIR/completion/_fnm ] && fpath+="$ZDOTDIR/completion/"
# export FZF_DEFAULT_COMMAND='rg --hidden -l ""'
# compinit

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
# bindkey '^e' edit-command-line


# Environment variables set everywhere
export EDITOR="nvim"
# export TERMINAL="alacritty"
# export BROWSER="brave"
# export PAGER="less"

# For QT Themes
# export QT_QPA_PLATFORMTHEME=qt5ct

 # [[ -s /root/.autojump/etc/profile.d/autojump.sh ]] && source /root/.autojump/etc/profile.d/autojump.sh

# autoload -U compinit && compinit -u



# colur  tree command
# eval "$(dircolors -b)"
# eval "$(starship init zsh)"
# export DISPLAY=172.30.240.1:0.0
# export LIBGL_ALWAYS_INDIRECT=1

# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/amit/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/amit/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/amit/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/amit/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

