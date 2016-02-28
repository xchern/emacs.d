(require-package 'org)

(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

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

;; following settings based on https://github.com/wuyao721/51docs/blob/master/it/emacs-org-mode-pdf.org
;; before using please:
;;   1.install font SimSun, SimHei, KaiTi
;;   2.install texlive packages

(require 'ox-latex)

(setq org-latex-logfiles-extensions
      '("aux" "blg" "idx" "log" "out" "toc" "nav" "snm" "vrb"))

;; (setq org-texinfo-remove-logfiles nil)

(setq org-latex-default-class "zh-article")

(add-to-list 'org-file-apps '("pdf" . "evince %s"))

;; Compile with XeLaTeX
(setq org-latex-pdf-process
	  '("xelatex -interaction nonstopmode -output-directory %o %f"
        "bibtex %b"
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"))

(setq org-latex-packages-alist
      '(("colorlinks=true, linkcolor = blue, citecolor = green" "hyperref" nil)
        ("" "xeCJK" t) ;; support chinese characters
        "\\setCJKmainfont[BoldFont=SimHei, ItalicFont=KaiTi]{SimSun}"))

;; New org latex classes, inset
;; #+LaTeX_CLASS: CLASS_NAME
;; at the beginning to specify.

;; Org latex class zh-report
(add-to-list 'org-latex-classes
			 '("zh-report"
			   "\\documentclass{report}
[DEFAULT-PACKAGES]
[PACKAGES]
\\usepackage{indentfirst}
\\usepackage{fontspec}
\\setmainfont{Liberation Serif}
\\usepackage{geometry}
\\geometry{left=1.5in,right=1.25in,top=1in,bottom=1in}
[EXTRA]"
         ("\\chapter{%s}" . "\\chapter*{%s}")
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
         ("\\paragraph{%s}" . "\\paragraph*{%s}")
         ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; Org latex class zh-article
(add-to-list 'org-latex-classes
			 '("zh-article"
			   "\\documentclass{article}
[DEFAULT-PACKAGES]
[PACKAGES]
\\usepackage{indentfirst}
\\usepackage{fontspec}
\\setmainfont{Liberation Serif}
\\usepackage{geometry}
\\geometry{left=1.5in,right=2in,top=1in,bottom=1in}
[EXTRA]"
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
         ("\\paragraph{%s}" . "\\paragraph*{%s}")
         ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
