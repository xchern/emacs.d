(setq inhibit-startup-message t) ; close init screen

(scroll-bar-mode -1)
(setq column-number-mode t) ; show column number
(global-linum-mode);; line number before each line

(setq default-tab-width 4);; set default indent width
(setq-default indent-tabs-mode nil);; do not use tab to indent

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
(setq buffer-file-coding-system 'utf-8-unix)

(setq initial-scratch-message ";; Happy emacsing!
")

(setq frame-title-format "emacs@%b");; title format

(require-package 'resize-window);; little extension to resize window M-x resize-window to take funtion

(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
(global-set-key [f11] 'toggle-fullscreen)

(global-set-key [f5] 'gdb)
(global-set-key [f9] 'compile)

(provide 'init-misc)
