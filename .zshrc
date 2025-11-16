# 自動補完関数
autoload -Uz compinit
compinit

#エイリアス
alias ls='lsd'
alias vi='nvim'

# Nim
export PATH=/home/con/.nimble/bin:$PATH

# direnv
eval "$(direnv hook zsh)"

# sheldon
eval "$(sheldon source)"

# 色を使用出来るようにする
autoload -Uz colors
colors

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# cd なしでもディレクトリ移動
setopt auto_cd

# ビープ音の停止
setopt no_beep

# ビープ音の停止(補完時)
setopt nolistbeep

# cd [TAB] で以前移動したディレクトリを表示
setopt auto_pushd

# ヒストリ (履歴) を保存、数を増やす
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# 同時に起動した zsh の間でヒストリを共有する
setopt share_history

# 直前と同じコマンドの場合はヒストリに追加しない
setopt hist_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# コマンドのスペルを訂正する
setopt correct

# 拡張 glob を有効にする
# 拡張 glob を有効にすると # ~ ^ もパターンとして扱われる
# glob: パス名にマッチするワイルドカードパターンのこと
# ※ たとえば mv hoge.* ~/dir というコマンドにおける * のこと
setopt extended_glob

# 単語の一部として扱われる文字のセットを指定する
# ここではデフォルトのセットから / を抜いたものにしている
# ※ たとえば Ctrl-W でカーソル前の1単語を削除したとき / までで削除が止まる
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# zの設定
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# fzfの設定
export FZF_CTRL_T_COMMAND='rg --files --hidden --glob "!.git/*"'
export FZF_CTRL_T_OPTS='--preview "bat  --color=always --style=header,grid --line-range :100 {}"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history

# ghqの設定
function ghq-fzf() {
  local src=$(ghq list | fzf --preview "ls -laTp $(ghq root)/{} | tail -n+4 | awk '{print \$9\"/\"\$6\"/\"\$7 \" \" \$10}'")
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N ghq-fzf
bindkey '^]' ghq-fzf

# cdr自体の設定
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
    zstyle ':completion:*' recent-dirs-insert both
    zstyle ':chpwd:*' recent-dirs-default true
    zstyle ':chpwd:*' recent-dirs-max 1000
fi

# fzf cdr
function fzf-cdr() {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | fzf --reverse)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N fzf-cdr
setopt noflowcontrol
bindkey '^q' fzf-cdr

# fzf
export FZF_COMPLETION_TRIGGER=','
typeset -Tgx FZF_DEFAULT_OPTS fzf_default_opts " "
fzf_default_opts=(
  '--height=90%'
  '--reverse'
  '--border'
  '--inline-info'
  '--prompt="➜  "'
  '--margin=0,2'
  '--tiebreak=index'
  '--no-mouse'
  '--filepath-word'
)

() {
  local -A color_map=(
    [fg]='-1'
    [bg]='-1'
    [hl]='33'
    [fg+]='250'
    [bg+]='235'
    [hl+]='33'
    [info]='37'
    [prompt]='37'
    [pointer]='230'
    [marker]='230'
    [spinner]='37'
  )

  for x in "${(k)color_map[@]}"; do
    fzf_color_opts+=("${x}:${color_map[${x}]}")
  done
  fzf_default_opts+=( '--color="'"${(j.,.)fzf_color_opts}"'"' )
}

() {
  local -a fzf_bind_opts=()
  local -A bind_map=(
    [?]='toggle-preview'
    [ctrl-a]='toggle-all'
    ['ctrl-]']='replace-query'
    [ctrl-w]='backward-kill-word'
    [ctrl-x]='jump'
    [ctrl-z]='ignore'
    [up]='preview-page-up'
    [down]='preview-page-down'
  )

  for x in "${(k)bind_map[@]}"; do
    fzf_bind_opts+=("${x}:${bind_map[${x}]}")
  done
  fzf_default_opts+=( '--bind="'"${(j:,:)fzf_bind_opts}"'"' )
}

# fzf.zshの設定
source <(fzf --zsh)

# rangerの設定（サブシェルのネストを防止する）
function ranger() {
  if [ -z "$RANGER_LEVEL" ]; then
    /usr/bin/ranger $@
  else
    exit
  fi

}

# URLの設定
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

## 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
## 補完候補を一覧表示したとき、Tabや矢印で選択できるようにする
zstyle ':completion:*:default' menu select=1

eval "$(starship init zsh)"

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# tmux
if [[ ! -n $TMUX && $- == *l* ]]; then
  # get the IDs
  ID="`tmux list-sessions`"
  if [[ -z "$ID" ]]; then
    tmux new-session
  fi
  create_new_session="Create New Session"
  ID="$ID\n${create_new_session}:"
  ID="`echo $ID | $PERCOL | cut -d: -f1`"
  if [[ "$ID" = "${create_new_session}" ]]; then
    tmux new-session
  elif [[ -n "$ID" ]]; then
    tmux attach-session -t "$ID"
  else
    :  # Start terminal normally
  fi
fi
