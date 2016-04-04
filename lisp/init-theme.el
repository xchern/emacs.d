(require-package 'spacemacs-theme)

(load-theme 'spacemacs-dark t)

(setq spacemacs-dark-theme t)

(defun switch-spacemacs-theme ()
  (interactive)
  "Used for switch theme between dark and light"
  (setq spacemacs-dark-theme (not spacemacs-dark-theme))
  (if spacemacs-dark-theme
	  (load-theme 'spacemacs-dark t)
	(load-theme 'spacemacs-light t))
  (powerline-reset))

(global-set-key [f7] 'switch-spacemacs-theme)

(require-package 'powerline)

(powerline-default-theme)

(provide 'init-theme)
