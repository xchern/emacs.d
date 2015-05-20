(setq inhibit-startup-message t) ; close init screen

(setq column-number-mode t) ; show column number
(global-linum-mode);; line number before each line

(setq default-tab-width 4);; set default indent width

(setq enable-recursive-minibuffers t);; use minibuffer recursively

(show-paren-mode t);; auto match parentheses
(setq show-paren-style 'parentheses)
(fset 'yes-or-no-p 'y-or-n-p);; ask for y/n instead of yes/no
(auto-image-file-mode t) ;; show image in emacs
(mouse-avoidance-mode 'animate);; mouse avoid cursor
(setq dired-recursive-copies 'top);; dired copy and delete recursively
(setq dired-recursive-deletes 'top)
(setq display-time-24hr-format t);; show time
(display-time-mode t)
(tool-bar-mode -1);; do not show tool bar
(setq use-dialog-box nil);; do not use dialogs
(setq initial-scratch-message ";; Happy emacsing!
")

(setq frame-title-format "emacs@%b");; title format
(setq user-full-name "Xiaosong Chen");; personal infomation
(setq user-mail-address "xiaosong0911@gmail.com")

(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
					   (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
(global-set-key [f11] 'toggle-fullscreen)

(require 'package)
(package-initialize)
;; package server list
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; smex can auto complete the M-x command
;; smex key-bonding
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; color-theme can adjust the color of the ui
(color-theme-initialize)
(color-theme-calm-forest)

;; guile as default scheme interpreter
(setq scheme-program-name "guile")

(provide 'init-main)
