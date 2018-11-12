(defpackage d10
  (:use :cl :stumpwm))

(in-package :d10)

(redirect-all-output (data-dir-file "stumpwm-debug" "log"))

(ql:quickload :swank)
(handler-case
    (progn
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

(d10/load "commands")
(d10/load "keys")
(d10/load "visuals")
(d10/load "programs")
