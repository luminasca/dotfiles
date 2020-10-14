set -U FZF_LEGACY_KEYBINDINGS 0

set -Ux PYENV_ROOT $HOME/.pyenv
set -Ux fish_user_paths $PYENV_ROOT/bin $fish_user_paths
source (pyenv init -|psub)

set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache

# Powerline
function fish_prompt
    eval /usr/bin/powerline-go -error $status -shell bare
end

function fish_user_key_bindings
  bind \co 'peco_select_history (commandline -b)' # control + O
  bind \cx\ck peco_kill # control + X からの control + K
end
