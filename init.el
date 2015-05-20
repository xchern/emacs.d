(if (eq system-type 'windows-nt) (server-start))

(package-initialize)

(add-to-list
    'load-path 
    (expand-file-name "lisp" user-emacs-directory))

(require 'init-main)

(require 'init-font)
(require 'init-org-babel)

(provide 'init)
