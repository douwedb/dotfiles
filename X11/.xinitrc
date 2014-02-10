[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

urxvtd -q -f -o
/usr/lib/systemd/systemd --user &

exec awesome
