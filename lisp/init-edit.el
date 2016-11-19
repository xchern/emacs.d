(require 'init-elpa)

;; Write backup files to `backups` directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; join-line key-bind
(global-set-key (kbd "C-x ^") 'join-line)

(setq default-tab-width 4);; set default indent width
(setq-default indent-tabs-mode nil);; do not use tab to indent

;; encoding settings
(set-language-environment 'UTF-8)
(set-locale-environment "UTF-8")
(setq buffer-file-coding-system 'utf-8-unix)

;; yasnippet complete snippet
(require-package 'yasnippet)
(yas-global-mode 1)
(setq yas/root-directory (expand-file-name "snippets" user-emacs-directory))
(yas/load-directory yas/root-directory)

;; flycheck
(require-package 'flycheck)
(global-flycheck-mode)

(provide 'init-edit)
