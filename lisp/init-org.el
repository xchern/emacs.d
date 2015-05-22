(require-package 'org)

(org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (gnuplot . t)
     (latex . t)
     (python . t)
     (sh . t)))

(provide 'init-org)
