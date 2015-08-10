(require-package 'spacemacs-theme)

(load-theme 'spacemacs-dark t)

(setq spacemacs-dark-theme t)

(defun theme-dark/light-switch ()
  (interactive)
  "Used for switch theme between dark and light"
  (setq spacemacs-dark-theme (not spacemacs-dark-theme))
  (if spacemacs-dark-theme
	  (load-theme 'spacemacs-dark t)
	(load-theme 'spacemacs-light t)
	))

(provide 'init-theme)
