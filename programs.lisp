(in-package :d10)

(run-shell-command "xmodmap /home/darth10/.xmodmap")
(run-shell-command "xkbset accessx sticky -twokey latchlock")
(run-shell-command "xkbset exp 1 '=accessx' '=sticky' '=twokey' '=latchlock'")

(run-shell-command "feh --bg-fill ~/Cloud/imgs/wallpapers/starf0rge.png")
(run-shell-command "xscreensaver -no-splash")
(run-shell-command "xfce4-power-manager")
(run-shell-command "nm-applet")
(run-shell-command "xfce4-volumed")
(run-shell-command "pasystray")
(run-shell-command "/home/darth10/.local/bin/pcloud")
(run-shell-command "blueman-applet")
