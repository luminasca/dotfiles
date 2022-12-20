
import XMonad
import XMonad.Hooks.DynamicLog

main = xmonad =<< xmobar def
    { terminal              = "mate-terminal"
    , modMask               = mod4Mask
    , borderWidth           = 2
    , normalBorderColor     = "#cccccc"
    , focusedBorderColor    = "#cd8b00"
    }
