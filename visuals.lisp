(load-module "ttf-fonts")
(load-module "cpu")
(load-module "mem")
(load-module "battery-portable")

(in-package :cpu)
(setf *cpu-modeline-fmt* "%c %t")

(in-package :d10)

(set-font (make-instance 'xft:font :family "Consolas" :subfamily "Regular" :size 12))

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

 *mode-line-timeout* 5
 *mode-line-background-color* "Black"
 *mode-line-border-color* "Black"
 *mode-line-border-width* 8
 *mode-line-pad-y*  4

 *maxsize-border-width*   2
 *normal-border-width*    2

 *screen-mode-line-format*
 '("^2*" (:eval (time-format "%a %b %d %k:%M:%S"))
   " ^5* %C"                     ; cpu
   " ^5* %M"                     ; mem
   " ^5* BAT:  %B"               ; battery
   " ^2*  %g"                    ; groups
   )

 *mouse-focus-policy* :click)

(set-focus-color "Black")

(update-color-map (current-screen))
(enable-mode-line (current-screen) (current-head) t)

(in-package :stumpwm)
(setq *window-info-format*
      (format nil "^>^B^5*%c ^b^6*%w^7*x^6*%h^7*~%%t"))

(load-module "stumptray")
(in-package :stumptray)
(if (not (current-tray))
    (stumptray))
