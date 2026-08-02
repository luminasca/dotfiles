!/usr/bin/bash

# メニュー項目の定義
entries="Lock\nLogout\nSuspend\nReboot\nShutdown"
selected=$(echo -e "$entries" | wofi --width 250 --height 230 --dmenu --prompt "Power Menu")

# 選択に応じた処理
case "$selected" in
    Lock)     swaylock ;;            # ロック（swaylockがインストールされている前提）
    Logout)   swaymsg exit ;;        # Swayのログアウト
    Suspend)  systemctl suspend ;;    # サスペンド
    Reboot)   systemctl reboot ;;     # 再起動
    Shutdown) systemctl poweroff ;;   # シャットダウン
esac
