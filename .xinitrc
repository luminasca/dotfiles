# set the cursor
xsetroot -cursor_name left_ptr
# set Japanese keyboard layout
setxkbmap -layout jp

#Fcitx5
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

fcitx5 &

# start xmonad
exec xmonad
