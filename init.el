;; change custom-file or init.el (this file) will be modified.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq custom-file (expand-file-name "customize.el" user-emacs-directory))

;; used for split configrations in to different files
(add-to-list
    'load-path 
    (expand-file-name "lisp" user-emacs-directory))

;; for automatic load packages, download & install when not installed
(require 'init-elpa)

;; user interface
(require 'init-ui)

;; edit
(require 'init-edit)

;; language support
(require 'init-lang)

;;(require 'init-org)

;; load config file
(let ((config-file (expand-file-name "config.el" user-emacs-directory)))
  (if (file-exists-p config-file)
      (load config-file)
    (message "[customize] You have no 'config.el' file in 'emacs.d' diretory. Write one!")))

(provide 'init)
