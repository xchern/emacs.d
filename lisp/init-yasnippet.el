(require-package 'yasnippet)
(yas-global-mode 1)
(setq yas/root-directory (expand-file-name "snippets" user-emacs-directory))
(yas/load-directory yas/root-directory)

(provide 'init-yasnippet)
