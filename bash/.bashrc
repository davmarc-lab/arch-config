# ~/.bashrc
#

# oh-my-posh terminal theme
eval "$(oh-my-posh init bash --config ~/.config/ohmyposh/theme.json)"

HISTCONTROL=ignoredumps:ignorespace

# show at the start all system info
neofetch


xset -b

#execute the .bash_aliases if exist
if [ -e .bash_aliases ]; then  
	source .bash_aliases
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# enable auto cd when typing the path
shopt -s autocd

