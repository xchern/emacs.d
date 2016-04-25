;; used for split configrations in to different files
;; (add-to-list
;;     'load-path 
;;     (expand-file-name "lisp" user-emacs-directory))

(package-initialize)

(setq custom-file (expand-file-name "customize.el" user-emacs-directory))

;;--------------------------------------------------------------------------------------------------
;; ELPA
(require 'package)
;; package server list
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(defun maybe-require-package (package &optional min-version no-refresh)
  "Try to install PACKAGE, and return non-nil if successful.
In the event of failure, return nil and print a warning message.
Optionally require MIN-VERSION.  If NO-REFRESH is non-nil, the
available package lists will not be re-downloaded in order to
locate PACKAGE."
  (condition-case err
      (require-package package min-version no-refresh)
    (error
     (message "Couldn't install package `%s': %S" package err)
     nil)))

;;--------------------------------------------------------------------------------------------------
;; org-mode
(require-package 'org)

(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-hide-leading-stars t)
(setq org-log-done 'time)

(setq org-todo-keywords
	  '((sequence "TODO(t)" "WAITING(w@/!)" "|" "DONE(d!)"  "CANCELED(c@/@)")))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (gnuplot . t)
   (latex . t)
   (python . t)
   (sh . t)))

;; following settings based on https://github.com/wuyao721/51docs/blob/master/it/emacs-org-mode-pdf.org
;; before using please:
;;   1.install font SimSun, SimHei, KaiTi
;;   2.install texlive packages

(require 'ox-latex)

(setq org-latex-logfiles-extensions
      '("aux" "blg" "idx" "log" "out" "toc" "nav" "snm" "vrb"))

;; (setq org-texinfo-remove-logfiles nil)

(setq org-latex-default-class "zh-article")

(add-to-list 'org-file-apps '("pdf" . "evince %s"))

;; Compile with XeLaTeX
(setq org-latex-pdf-process
	  '("xelatex -interaction nonstopmode -output-directory %o %f"
        "bibtex %b"
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"))

;; set hyperref package color style
(delete '("" "hyperref" nil) org-latex-default-packages-alist)
(add-to-list 'org-latex-default-packages-alist
       '("colorlinks=true, linkcolor = blue, citecolor = green" "hyperref" nil))

(setq org-latex-packages-alist
      '(("" "xeCJK" t) ;; support chinese characters
        "\\setCJKmainfont[BoldFont=SimHei, ItalicFont=KaiTi]{SimSun}"))

;; New org latex classes, inset
;; #+LaTeX_CLASS: CLASS_NAME
;; at the beginning to specify.

;; Org latex class zh-report
(add-to-list 'org-latex-classes
			 '("zh-report"
			   "\\documentclass{report}
[DEFAULT-PACKAGES]
[PACKAGES]
\\usepackage{indentfirst}
\\usepackage{fontspec}
\\setmainfont{Liberation Serif}
\\usepackage{geometry}
\\geometry{left=1.5in,right=1.25in,top=1in,bottom=1in}
[EXTRA]"
         ("\\chapter{%s}" . "\\chapter*{%s}")
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
         ("\\paragraph{%s}" . "\\paragraph*{%s}")
         ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; Org latex class zh-article
(add-to-list 'org-latex-classes
			 '("zh-article"
			   "\\documentclass{article}
[DEFAULT-PACKAGES]
[PACKAGES]
\\usepackage{indentfirst}
\\usepackage{fontspec}
\\setmainfont{Liberation Serif}
\\usepackage{geometry}
\\geometry{left=1.5in,right=2in,top=1in,bottom=1in}
[EXTRA]"
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
         ("\\paragraph{%s}" . "\\paragraph*{%s}")
         ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;;--------------------------------------------------------------------------------------------------
;; MISC
(setq inhibit-startup-message t) ; close init screen

(scroll-bar-mode -1)
(setq column-number-mode t) ; show column number
(global-linum-mode);; line number before each line
(setq linum-format "%3d\u2502");; line number format

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

(setq initial-scratch-message ";; Happy hacking emacs!
")

(setq frame-title-format "emacs@%b");; title format

(global-set-key [f11] 'toggle-frame-fullscreen)

(global-set-key (kbd "s-<f5>") 'gdb)

;;--------------------------------------------------------------------------------------------------
;; helm
(require-package 'helm)

(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "\C-x\C-f") 'helm-find-files)

;;--------------------------------------------------------------------------------------------------
;; multi-cursors
(require-package 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

;;--------------------------------------------------------------------------------------------------
;; flycheck
(require-package 'flycheck)
(global-flycheck-mode)

;;--------------------------------------------------------------------------------------------------
;; smartparens
(require-package 'smartparens)
(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook       #'smartparens-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'smartparens-mode)
(add-hook 'lisp-mode-hook             #'smartparens-mode)
(add-hook 'lisp-interaction-mode-hook #'smartparens-mode)
(add-hook 'scheme-mode-hook           #'smartparens-mode)

;;--------------------------------------------------------------------------------------------------
;; which-key
(require-package 'which-key)
(which-key-mode 1)

;;--------------------------------------------------------------------------------------------------
;; sr-speedbar
(require-package 'sr-speedbar)

(global-set-key [f5] 'sr-speedbar-toggle)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-skip-other-window-p t)

;;--------------------------------------------------------------------------------------------------
;; smart-compile
(require-package 'smart-compile)
(global-set-key [f9] 'smart-compile)

;;--------------------------------------------------------------------------------------------------
;;(require 'init-yasnippet)
(require-package 'yasnippet)

(yas-global-mode 1)
(setq yas/root-directory (expand-file-name "snippets" user-emacs-directory))
(yas/load-directory yas/root-directory)

;;--------------------------------------------------------------------------------------------------
;;(require 'init-avy)
(require-package 'avy)

(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)

(avy-setup-default)

;;--------------------------------------------------------------------------------------------------
;;(require 'init-ace-window)
(require-package 'ace-window)
(require 'ace-window)

(global-set-key (kbd "C-x o") 'ace-window)

;;--------------------------------------------------------------------------------------------------
;;(require 'init-resize-window)
(require-package 'resize-window);; an extension to resize window M-x resize-window to take funtion

;;--------------------------------------------------------------------------------------------------
;; geiser
(require-package 'geiser)

;;--------------------------------------------------------------------------------------------------
;; markdown mode
(require-package 'markdown-mode)

;;--------------------------------------------------------------------------------------------------
;; auctex
(require-package 'auctex)

;;--------------------------------------------------------------------------------------------------
;; haskell mode
(require-package 'haskell-mode)

;;--------------------------------------------------------------------------------------------------
;; viper mode
;;(setq viper-mode t)
;;(require 'viper)

;;--------------------------------------------------------------------------------------------------
;; set theme
(require-package 'sublime-themes)

(setq theme-now-dark t)
(load-theme 'spolsky t)

(defun switch-theme-dark/light ()
  (interactive)
  "Used for switch theme between dark and light"
  (setq theme-now-dark (not theme-now-dark))
  (if theme-now-dark
	  (load-theme 'spolsky t)
    (load-theme 'mccarthy t))
  (powerline-reset))
(global-set-key [f7] 'switch-theme-dark/light)

(require-package 'powerline)
(powerline-default-theme)

;;--------------------------------------------------------------------------------------------------
;;(require 'init-font)
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

(require 'cl);;find-if in the package


(defun init-set-font ()
  ;; find avaliable font
  (let ((default-en-font (find-if 'font-existsp en-font-list))
        (default-zh-font (find-if 'font-existsp zh-font-list)))
    (if (not (or (null default-en-font) (null default-zh-font)))
        (progn
          ;; Set regular font
          (set-face-attribute 'default nil
                              :family (car default-en-font)
                              :height 100)
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
      (message "No font suits"))))

(if (and (fboundp 'daemonp) (daemonp))
	(add-hook 'after-make-frame-functions
			  (lambda (frame)
				(with-selected-frame frame
				  (init-set-font))))
  (init-set-font))

;;--------------------------------------------------------------------------------------------------

(if (file-exists-p custom-file)
	(load custom-file)
  (message "[customize]You have no 'customize.el' file in 'emacs.d' diretory."))

(provide 'init)
