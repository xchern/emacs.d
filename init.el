(if (eq system-type 'windows-nt) (server-start))

(add-to-list
    'load-path 
    (expand-file-name "lisp" user-emacs-directory))

(package-initialize)

(require 'init-customize)

(require 'init-font)


(require 'init-elpa)

(require 'init-smex)
(require 'init-org)
(require 'init-theme)
(require 'init-markdown)

(provide 'init)