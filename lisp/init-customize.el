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

(setq make-backup-files nil);; do not backup files

(set-language-environment 'UTF-8)
(set-locale-environment "UTF-8")

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

;; guile as default scheme interpreter
(setq scheme-program-name "guile")

(provide 'init-customize)
