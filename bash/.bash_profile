#
# ~/.bash_profile
#

# start i3 at the start of the system
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ] ; then
    exec startx
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc

