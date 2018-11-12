(in-package :d10)

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
