(in-package :d10)

(run-shell-command "xmodmap /home/darth10/.xmodmap")
(run-shell-command "xkbset accessx sticky -twokey latchlock")
(run-shell-command "xkbset exp 1 '=accessx' '=sticky' '=twokey' '=latchlock'")

(run-shell-command "feh --bg-fill ~/.local/lib/starf0rge.png")
(run-shell-command "xfce4-notifyd")
(run-shell-command "xfce4-screensaver")
(run-shell-command "xfce4-power-manager")
(run-shell-command "xfce4-volumed-pulse")
(run-shell-command "polkit-agent")
(run-shell-command "pasystray")
(run-shell-command "nm-applet")
(run-shell-command "redshift-gtk -l -41.37:174.78") ;; Location: Wellington, NZ
(run-shell-command "blueman-applet")
(run-shell-command "/opt/piavpn/bin/pia-client --quiet")
(run-shell-command "/home/darth10/.local/bin/pcloud")
