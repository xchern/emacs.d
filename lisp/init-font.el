(defvar en-font-list;; 英文字体列表
  '("Courier New"
	"Liberation Mono"
	"Consolas"
	"Monaco"
	))

(defvar zh-font-list;; 中文字体列表
  '("华文仿宋" "STFangsong"
	"黑体" "SimHei"
	"微软雅黑" "Microsoft YaHei"
	"文泉驿等宽微米黑" "WenQuanYi Micro Hei Mono"
    "宋体" "SimSun"
	))

;; 优先使用字体列表中靠前的字体

(defvar zh-font-size-ratio 1.115);; 中文字体的放缩比例(方便调整为与英文字体等宽)

(defun font-existsp (font)
  (if (null (x-list-fonts font))
	  nil t))

(require 'cl);;find-if in the package


(defun init-set-font ()
  ;; find avaliable font
  (defvar default-en-font (find-if 'font-existsp en-font-list))
  (defvar default-zh-font (find-if 'font-existsp zh-font-list))
  ;; Set regular font
  (set-face-attribute 'default nil
					  :family default-en-font
					  :height 100)
  ;; Set font for han characters
  (set-fontset-font t 'han
					default-zh-font
					nil)
  ;; Set han font rescale ratio
  (setq face-font-rescale-alist
		(list (cons default-zh-font zh-font-size-ratio))))

(if (and (fboundp 'daemonp) (daemonp))
	(add-hook 'after-make-frame-functions
			  (lambda (frame)
				(with-selected-frame frame
				  (init-set-font))))
  (init-set-font))
;;(init-set-font)

(provide 'init-font)

