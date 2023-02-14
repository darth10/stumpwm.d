(in-package :d10)

(defcommand logout (surep)
  ((:y-or-n "Are you sure you want to logout, killing all your programs?"))
  (if surep (quit) t))

(defcommand lock () ()
  (run-shell-command "xflock4"))

(defcommand sound-toggle () ()
  "Toggle sound"
  (run-shell-command "pactl set-sink-mute 0 toggle"))

(defcommand sound-increase () ()
  "Increase sound volume"
  (run-shell-command "pactl -- set-sink-volume 0 +10%"))

(defcommand sound-decrease () ()
  "Decrease sound volume"
  (run-shell-command "pactl -- set-sink-volume 0 -10%"))

(defcommand run-or-raise-emacs () ()
  (run-or-raise "emacs --debug-init" '(:class "Emacs")))

(defcommand run-or-raise-chrome () ()
  (run-or-raise "google-chrome-stable" '(:class "Google-chrome")))

(defcommand run-or-raise-terminal () ()
  (run-or-raise "kitty" '(:class "kitty")))

(defcommand run-htop () ()
  (run-shell-command "kitty -e htop"))
