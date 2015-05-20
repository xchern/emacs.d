(defvar en-font-list;; 英文字体列表
  '("Consolas"
	"Monaco"
	"Liberation Mono"))

(defvar zh-font-list;; 中文字体列表
  '("文泉驿等宽微米黑"
  	"WenQuanYi Micro Hei Mono"
    "微软雅黑"
    "Microsoft YaHei"
    "宋体"
    "SimSun"))

;; 优先使用字体列表中考前的字体

(defvar zh-font-size-ratio 1.115);; 中文字体的放缩比例(方便调整为与英文字体等宽)

(defun font-existsp (font)
  (if (null (x-list-fonts font))
	  nil t))

(require 'cl);;find-if in the package

;; Set regular font
(set-face-attribute 'default nil
					:family (find-if 'font-existsp en-font-list)
					:height 110)

;; Set font for han characters
(let ((zh-font (find-if 'font-existsp zh-font-list)))
  (set-fontset-font t 'han
					zh-font
					nil 'prepend)
  (setq face-font-rescale-alist (list (cons zh-font zh-font-size-ratio))))

(provide 'init-font)
