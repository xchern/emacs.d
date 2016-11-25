;; haskell mode
(require-package 'haskell-mode)
(add-hook 'haskell-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-c") 'haskell-process-load-file))
		  	(local-set-key (kbd "C-c h") 'hoogle))

;; lua mode
(require-package 'lua-mode)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
(add-hook 'lua-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-c") 'lua-send-buffer)
            (setq lua-indent-level 4)))
          

(provide 'init-lang)
