;; haskell mode
(require-package 'haskell-mode)
(add-hook 'haskell-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-c") 'haskell-process-load-file))
		  	(local-set-key (kbd "C-c h") 'hoogle))

(provide 'init-lang)
