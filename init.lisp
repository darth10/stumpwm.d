(defpackage d10
  (:use :cl :stumpwm))

(in-package :d10)

(redirect-all-output (data-dir-file "stumpwm-debug" "log"))

(handler-case
    (progn
      (ql:quickload :swank)
      (swank:create-server
       :dont-close t
       :port swank::default-server-port))
  (error (c)
    (format t "Error starting swank: ~a~%" c)))

(defun d10/define-key (map key command)
  (define-key map (kbd key) command))

(defvar d10/init-directory
  (directory-namestring
   (truename (merge-pathnames (user-homedir-pathname)
                              ".stumpwmrc"))))

(defun d10/load (filename)
  (let ((file (merge-pathnames (concat filename ".lisp")
                               d10/init-directory)))
    (if (probe-file file)
        (load file)
        (format *error-output* "File '~a' doesn't exist." file))))

(set-module-dir (merge-pathnames "modules" d10/init-directory))

;; TODO split into more files
(d10/load "commands")

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

(set-prefix-key (kbd "s-x"))

(d10/define-key *top-map* "XF86AudioMute" "sound-toggle")
(d10/define-key *top-map* "XF86AudioRaiseVolume" "sound-increase")
(d10/define-key *top-map* "XF86AudioLowerVolume" "sound-decrease")

(d10/define-key *top-map* "s-d" "run-shell-command thunar")
(d10/define-key *top-map* "s-l" "lock")
(d10/define-key *top-map* "s-SPC" "pull-hidden-next")
(d10/define-key *top-map* "s-Left" "gprev")
(d10/define-key *top-map* "s-Right" "gnext")
(d10/define-key *top-map* "s-F4" "delete")

(d10/define-key *top-map* "s-t" "run-htop")
(d10/define-key *top-map* "s-c" "run-or-raise-terminal")
(d10/define-key *top-map* "s-F5" "run-or-raise-chrome")
(d10/define-key *top-map* "s-F8" "run-or-raise-emacs")

(d10/define-key *root-map* "t" "run-htop")
(d10/define-key *root-map* "c" "run-or-raise-terminal")
(d10/define-key *root-map* "u" "run-or-raise-chrome")
(d10/define-key *root-map* "e" "run-or-raise-emacs")

(load-module "stumptray")
(in-package :stumptray)
(if (not (current-tray))
    (stumptray))
