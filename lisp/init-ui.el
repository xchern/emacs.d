(require 'init-elpa)
;; basic settings

(setq inhibit-startup-message t) ; close init screen
(setq initial-scratch-message ";; Happy hacking emacs!
")

(setq frame-title-format "emacs@%b");; title format

(tool-bar-mode -1);; do not show tool bar
(scroll-bar-mode -1);; do not show scroll bar
;; switch menubar
(global-set-key [f1] 'menu-bar-mode)

(global-linum-mode);; line number before each line
(setq linum-format 'dynamic);; line number format

(setq column-number-mode t) ; show column number

(setq display-time-24hr-format t);; show time
(display-time-mode t)

(show-paren-mode t);; auto match parentheses
(setq show-paren-style 'parentheses)
(add-hook 'prog-mode-hook #'highlight-parentheses-mode)

;; highlight word under cursor
(require-package 'idle-highlight-mode)
(add-hook 'prog-mode-hook #'idle-highlight-mode)

;; yafolding-mode
(require-package 'yafolding)
(add-hook 'prog-mode-hook #'yafolding-mode)

;; highlight-parentheses highlight parentheses surrunding the cursor
(require-package 'highlight-parentheses)

(mouse-avoidance-mode 'animate);; mouse avoid cursor

(fset 'yes-or-no-p 'y-or-n-p);; ask for y/n instead of yes/no
;; (setq enable-recursive-minibuffers t);; use minibuffer recursively

(auto-image-file-mode t) ;; show image in emacs

(setq use-dialog-box nil);; do not use dialogs

;; default search with regexp
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)


;; company-mode
(require-package 'company)
(global-company-mode)
;; company theme
(require 'color)
(defun set-company-theme ()
  (let ((bg (face-attribute 'default :background)))
    (custom-set-faces
     `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 8)))))
     `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
     `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
     `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
     `(company-tooltip-common ((t (:inherit font-lock-constant-face)))))))

;; sr-speedbar
(require-package 'sr-speedbar)
(setq sr-speedbar-right-side nil
      sr-speedbar-skip-other-window-p t
      speedbar-show-unknown-files t
      speedbar-use-images nil)

;; powerline
(require-package 'powerline)
(powerline-default-theme)

;; cycle the windows
(global-set-key (kbd "C-x o") 'other-window)
(global-set-key (kbd "C-x O") (lambda () (interactive)(other-window -1)));; reverse direction

;; which-key
(require-package 'which-key)
(which-key-mode 1)

;; Nicer naming of buffers for files with identical names
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator " • ")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

;; go to scratch buffer
(defun goto-scratch-buffer ()
    "Goto scratch buffer, if not exists, create one."
    (interactive)
    (switch-to-buffer (get-buffer-create "*scratch*")))

(global-set-key (kbd "C-x s") 'goto-scratch-buffer)

;; find file utils
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-x C-p") 'find-file-at-point)
(global-set-key (kbd "C-x y") 'bury-buffer)
(global-set-key (kbd "C-x t") 'revert-buffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-`") 'file-cache-minibuffer-complete)

;; ido mode
(ido-mode 1)
(ido-everywhere 1)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point t
      ido-max-prospects 10)
;; wider ido with ido-ubiquitous
(require-package 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;; Smex
(require-package 'smex)
;; Can be omitted. This might cause a (minimal) delay Smex is auto-initialized on its first run.
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; an extension to resize window
;; M-x resize-window to take funtion
(require-package 'resize-window)

;; load theme path
(add-to-list
    'custom-theme-load-path
    (expand-file-name "theme" user-emacs-directory))
;; work around theme switching bug
;; from redguardtoo's config
(defadvice load-theme (before disable-themes-first activate)
  ;; disable all themes
  (dolist (i custom-enabled-themes)
    (disable-theme i)))

;; theme specification
(defvar theme-dark 'spolsky)
(defvar theme-light 'mccarthy)
;; light dart theme switching
(setq theme-now-dark t)
(load-theme theme-dark t)

(defun switch-theme-dark/light ()
  "Switch theme between dark and light."
  (interactive)
  (setq theme-now-dark (not theme-now-dark))
  (if theme-now-dark
	  (load-theme theme-dark t)
    (load-theme theme-light t))
  (powerline-reset)
  (set-company-theme))

;; change font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)
(define-key global-map (kbd "C-=") (lambda () (interactive) (text-scale-increase 0)))

;; font specification
(require 'cl);;find-if in the package
(defvar en-font-list;; English fonts list (name . ratio)
  '(("DejaVu Sans Mono" . 0.6015)
    ("Liberation Mono" . 0.6015)
    ("Consolas" . 0.5493)
    ("Courier New" . 0.6015)
    ))
(defvar zh-font-list;; Chinese fonts (name . ratio), both name used for suit windows font name
  '(("文泉驿等宽微米黑" . 1.0)
    ("WenQuanYi Micro Hei Mono" . 1.0)
    ("黑体" . 1.0)
    ("SimHei" . 1.0)
    ("宋体" . 1.0)
    ("SimSun" . 1.0)
    ))

;; the font at front are first tested
(defun font-existsp (font-pair)
  (if (null (x-list-fonts (car font-pair)))
	  nil t))
(defun init-set-font ()
  (if (window-system)
      ;; find avaliable font
      (let ((default-en-font (find-if 'font-existsp en-font-list))
            (default-zh-font (find-if 'font-existsp zh-font-list)))
        (if (not (or (null default-en-font) (null default-zh-font)))
            (progn
              ;; Set regular font
              (set-face-attribute 'default nil
                                  :family (car default-en-font)
                                  :height 110)
              ;; Set font for han characters
              (set-fontset-font t 'han
                                (car default-zh-font)
                                nil)
              ;; Set han font rescale ratio
              (setq face-font-rescale-alist
                    (list (cons (car default-zh-font)
                                (* 2.05
                                   (/ (cdr default-en-font)
                                      (cdr default-zh-font))))))
              nil)
          (message "No font suits")))))

(if (and (fboundp 'daemonp) (daemonp))
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (init-set-font))))
  (init-set-font))

(provide 'init-ui)
