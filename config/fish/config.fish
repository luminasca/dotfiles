set -U FZF_LEGACY_KEYBINDINGS 0

set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache
set -x PATH /usr/local/bin $PATH
set -x GOPATH $HOME/.go

# Prompt
set -g fish_prompt_pwd_dir_length 0  # ディレクトリ省略しない
set -g theme_newline_cursor yes  # プロンプトを改行した先に設ける
set -g theme_display_git_master_branch yes  # git の branch 名を表示
set -g theme_color_scheme dracula
set -g theme_display_date no  # 時刻を表示しないように設定
set -g theme_display_cmd_duration no  # コマンド実行時間の非表示

function fish_user_key_bindings
  bind \co 'peco_select_history (commandline -b)' # control + O
  bind \cx\ck peco_kill # control + X からの control + K
end

# ranger->サブシェル->rangerの多重起動を避ける
function ranger
  if set -q -x RANGER_LEVEL
    exit
  else
    command ranger $argv
  end
end

# rangerのサブシェルから起動された場合はpromptを変更する
if set -q -x RANGER_LEVEL
  set -g _origin_prompt (fish_prompt)
  function fish_prompt
    echo "(RANGER)$_origin_prompt"
  end
end

# rusup
set -U fish_user_paths $fish_user_paths $HOME/.cargo/bin
