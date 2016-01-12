(defvar en-font-list;; 英文字体列表(名称 . 宽高比)
  '(("DejaVu Sans Mono" . 0.6015)
    ("Liberation Mono" . 0.6015)
    ("Consolas" . 0.5493)
    ("Courier New" . 0.6015)
    ))

(defvar zh-font-list;; 中文字体列表(名称 . 宽高比)
  '(("文泉驿等宽微米黑" . 1.0)
    ("WenQuanYi Micro Hei Mono" . 1.0)
    ("黑体" . 1.0)
    ("SimHei" . 1.0)
    ("宋体" . 1.0)
    ("SimSun" . 1.0)
    ))

;; 优先使用字体列表中靠前的字体

(defun font-existsp (font-pair)
  (if (null (x-list-fonts (car font-pair)))
	  nil t))

(require 'cl);;find-if in the package


(defun init-set-font ()
  ;; find avaliable font
  (let ((default-en-font (find-if 'font-existsp en-font-list))
        (default-zh-font (find-if 'font-existsp zh-font-list)))
    (if (not (or (null default-en-font) (null default-zh-font)))
        (progn
          ;; Set regular font
          (set-face-attribute 'default nil
                              :family (car default-en-font)
                              :height 100)
          ;; Set font for han characters
          (set-fontset-font t 'han
                            (car default-zh-font)
                            nil)
          ;; Set han font rescale ratio
          (setq face-font-rescale-alist
                (list (cons (car default-zh-font)
                            (* 2.05
                               (/ (cdr default-en-font)
                                  (cdr default-zh-font))))))
          nil)
      (message "No font suits"))))

(if (and (fboundp 'daemonp) (daemonp))
	(add-hook 'after-make-frame-functions
			  (lambda (frame)
				(with-selected-frame frame
				  (init-set-font))))
  (init-set-font))

(provide 'init-font)

