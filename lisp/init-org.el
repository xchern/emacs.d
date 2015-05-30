(require-package 'org)

(setq org-hide-leading-stars t)
(setq org-log-done 'time)

(setq org-todo-keywords
	  '((sequence "TODO(t)" "WAITING(w@/!)" "|" "DONE(d!)"  "CANCELED(c@/@)")))

(org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (gnuplot . t)
     (latex . t)
     (python . t)
     (sh . t)))

(provide 'init-org)
