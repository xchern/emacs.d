(add-to-list
    'load-path 
    (expand-file-name "lisp" user-emacs-directory))

(package-initialize)

(setq custom-file (expand-file-name "customize.el" user-emacs-directory))

(require 'init-elpa)

(if (file-exists-p custom-file)
	(load custom-file)
  (message "[customize]You have no 'customize.el' file in 'emacs.d' diretory."))

(require 'init-geiser)
(require 'init-paredit)

(require 'init-org)
(require 'init-markdown)
(require 'init-auctex)
(require 'init-haskell)

(require 'init-sr-speedbar)
(require 'init-misc)
(require 'init-smart-compile)
(require 'init-multi-cursors)
(require 'init-helm)
(require 'init-yasnippet)
(require 'init-avy)
(require 'init-ace-window)
(require 'init-resize-window)
;; (require 'init-viper)
(require 'init-theme)
(require 'init-font)

(provide 'init)
