;; -*-lisp-*-

(in-package :cl-user)
(defpackage darth10-stumpwm
  (:use :cl :clx-truetype :stumpwm))
(in-package :darth10-stumpwm)

(set-module-dir "~/.stumpwm.d/stumpwm-contrib/")

(set-prefix-key (kbd "s-x"))

(defcommand logout (surep)
  ((:y-or-n "Are you sure you want to logout, killing all your programs?"))
  "Quit StumpWM, after making sure you really want to do that."
  (if surep (quit) t))

(run-shell-command "feh --bg-fill ~/Dropbox/imgs/wallpapers/starf0rge.png")
(run-shell-command "xmodmap /home/darth10/.xmodmap")
(run-shell-command "xkbset accessx sticky -twokey latchlock")
(run-shell-command "xkbset exp 1 '=accessx' '=sticky' '=twokey' '=latchlock'")

;; set font
(load-module "ttf-fonts")
(set-font (make-instance 'xft:font :family "Consolas" :subfamily "Regular" :size 11))

(load-module "cpu")
(load-module "net")
(load-module "battery-portable")

(defvar al/battery-mode-string "")

(when (probe-file "/sys/class/power_supply/BAT0")
  (setf al/battery-mode-string " ^7*%B"
        battery-portable:*refresh-time* 30))

(set-normal-gravity :bottom)

(setf
 *message-window-gravity* :bottom-right
 *input-window-gravity*   :center

 *window-info-format*
 (format nil "^>^B^5*%c ^b^6*%w^7*x^6*%h^7*~%%t")

 *time-format-string-default*
 (format nil "^5*%H:%M:%S~%^2*%A~%^7*%d %B")

 *mode-line-timeout* 5
 *screen-mode-line-format*
 '("^5*" (:eval (time-format "%k:%M"))
   " ^2*%n"                     ; group name
   " ^7*%c"                     ; cpu
   " ^6*%l"                     ; net
   al/battery-mode-string)

 *mouse-focus-policy* :click)

(defcommand darth10-stumpwm/mode-line-on () ()
  "Turn the mode line on unconditionally."
  (enable-mode-line (current-screen) (current-head) t))

(darth10-stumpwm/mode-line-on)
