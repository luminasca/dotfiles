#!/bin/bash
# rofi_launch.sh / JennyM 2016 malkalech.com

alpha="cc"   # opacity (00〜FF)

options=(
  -modi            "drun,system:~/.config/i3/bin/rofi_system.sh"
  -show            "drun"
  -font            "MotoyaLMaru 28"
  -width           "90"
  -padding         "80"
  -lines           "8"
  -fixed-num-lines
  -hide-scrollbar
  -sidebar-mode

  ##  key bindings  ##
  -kb-cancel        "Escape,Control+g,Control+bracketleft,Control+c"
  -kb-mode-next     "Shift+Right,Control+i,Control+Tab"
  -kb-mode-previous "Shift+Left,Control+Shift+i"
)

rofi "$@" "${options[@]}"
