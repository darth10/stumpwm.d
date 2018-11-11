;; -*-lisp-*-

(in-package :cl-user)
(defpackage d10
  (:use :cl :stumpwm))
(in-package :d10)

(set-module-dir "~/.stumpwm.d/modules")

(set-prefix-key (kbd "s-x"))

(defcommand logout (surep)
  ((:y-or-n "Are you sure you want to logout, killing all your programs?"))
  "Quit StumpWM, after making sure you really want to do that."
  (if surep (quit) t))

(run-shell-command "xmodmap /home/darth10/.xmodmap")
(run-shell-command "xkbset accessx sticky -twokey latchlock")
(run-shell-command "xkbset exp 1 '=accessx' '=sticky' '=twokey' '=latchlock'")

(run-shell-command "feh --bg-fill ~/Dropbox/imgs/wallpapers/starf0rge.png")
(run-shell-command "xscreensaver -no-splash")
(run-shell-command "xfce4-power-manager")
(run-shell-command "if ! pgrep -x 'wicd-client' > /dev/null; then wicd-client -t; fi")
(run-shell-command "dropbox start")

(load-module "ttf-fonts")
(set-font (make-instance 'xft:font :family "Consolas" :subfamily "Regular" :size 11))

(load-module "cpu")
(load-module "mem")
(load-module "battery-portable")

(set-normal-gravity :center)

(setf
 *colors* '("black"
            "red"
            "white"
            "yellow"
            "orange"
            "green"
            "orange"
            "white")

 *message-window-gravity* :center
 *input-window-gravity*   :center
 *mode-line-position*     :bottom
 *window-border-style*    :thin

 *window-info-format*
 (format nil "^>^B^5*%c ^b^6*%w^7*x^6*%h^7*~%%t")

 *mode-line-timeout* 5
 *mode-line-background-color* "Black"
 *mode-line-border-color* "Black"

 *screen-mode-line-format*
 '("^5*" (:eval (time-format "%a %b %d %k:%M:%S"))
   " ^2* %n "                   ; group name
   " ^5*%c %t"                  ; cpu
   " ^5*%M"                     ; mem
   " ^5*BAT: %B"                ; battery
   )

 *mouse-focus-policy* :click)

(update-color-map (current-screen))
(enable-mode-line (current-screen) (current-head) t)

(defcommand sound-toggle () ()
  "Toggle sound"
  (run-shell-command "pactl set-sink-mute 0 toggle"))

(defcommand sound-increase () ()
  "Increase sound volume"
  (run-shell-command "pactl -- set-sink-volume 0 +10%"))

(defcommand sound-decrease () ()
  "Decrease sound volume"
  (run-shell-command "pactl -- set-sink-volume 0 -10%"))

(defun d10/define-key (map key command)
  (define-key map (kbd key) command))

(d10/define-key *top-map* "XF86AudioMute" "sound-toggle")
(d10/define-key *top-map* "XF86AudioRaiseVolume" "sound-increase")
(d10/define-key *top-map* "XF86AudioLowerVolume" "sound-decrease")

(load-module "stumptray")
(in-package :stumptray)
(if (not (current-tray))
    (stumptray))
