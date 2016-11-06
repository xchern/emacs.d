;; highlight-parentheses
(add-hook 'prog-mode-hook       #'highlight-parentheses-mode)

;; sr-speedbar
(global-set-key [f5] 'sr-speedbar-toggle)

;; theme switch
(global-set-key [f7] 'switch-theme-dark/light)

;; smart-compile
(require-package 'smart-compile)
(global-set-key [f9] 'smart-compile)

;; geiser
(require-package 'geiser)

;; markdown mode
(require-package 'markdown-mode)

;; auctex
(require-package 'auctex)

;; haskell mode
(require-package 'haskell-mode)
