(if (eq system-type 'windows-nt) (server-start))

(add-to-list
    'load-path 
    (expand-file-name "lisp" user-emacs-directory))

(package-initialize)

(setq custom-file (expand-file-name "customize.el" user-emacs-directory))

(require 'init-utils)

(require 'init-font)


(require 'init-elpa)

(require 'init-smex)
(require 'init-org)
(require 'init-theme)
(require 'init-markdown)
(require 'init-auctex)
(require 'init-yasnippet)

(if (file-exists-p custom-file)
	(load custom-file)
  (message "[customize]You have no 'customize.el' file in 'emacs.d' diretory."))

(provide 'init)
