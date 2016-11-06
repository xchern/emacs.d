(require 'init-elpa)

(setq default-tab-width 4);; set default indent width
(setq-default indent-tabs-mode nil);; do not use tab to indent

(setq make-backup-files nil);; do not backup files

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
