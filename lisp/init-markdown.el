(require-package 'markdown-mode)
(setq markdown-command "pandoc -s -c styles.css --mathjax --highlight-style espresso")
(provide 'init-markdown)
