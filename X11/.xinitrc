[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

urxvtd -q -f -o

exec awesome
