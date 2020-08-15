(require 'cl-lib)
(require 'wttr-utils)
(wttr/prepend-to-exec-path "/usr/local/bin") ; only for mac
;; 在标题栏显示buffer的名字
(setq frame-title-format "emacs@%b")

;; 设置有用个人信息
(setq user-full-name "simon")
(setq user-mail-address "simon29rock@gmail.com")

;; 关闭欢迎画面
(setq inhibit-startup-message t)

(setq tool-bar-mode t)

;; 打开tabbar
(require 'tabbar)
(tabbar-mode)

;; 关闭提示音
(setq visible-bell nil); for mac

;; 设置默认字体
; windows
(if wttr/os:windowsp 
    (set-default-font "Courier New-11"))
; linux
(if wttr/os:linuxp
    (set-default-font "Monospace-11"))

;; 简化工具条
;(tool-bar-mode -1) ;for xwindows

;; 显示时间
;(display-time)
(display-time-mode 1);;启用时间显示设置，在minibuffer上面的那个杠上
(setq display-time-24hr-format t);;时间使用24小时制
(setq display-time-day-and-date t);;时间显示包括日期和具体时间

;; 显示行号
(setq column-number-mode t)

;;行号
(global-linum-mode t)

;; 显示匹配的括号
(show-paren-mode t)

;; 加大kill ring，防止出错后无法回滚文档
(setq kill-ring-max 100)

;; 把fill-column设为60
(setq default-fill-column 60)

;; 默认tab缩进
;;;;; 设置tab为4个空格的宽度 
(setq c-basic-offset 4) 
(setq-default indent-tabs-mode t) 
(setq default-tab-width 4) 
(setq tab-width 4) 
(setq tab-stop-list ()) 
(cl-loop for x downfrom 40 to 1 do 
(setq tab-stop-list (cons (* x 4) tab-stop-list))) 

;;(setq-default indent-tabs-mode nil)
;;(setq indent-tabs-mode nil)
;; 询问时的 yes or no 改为 y/n，减少输入量
(fset 'yes-or-no-p 'y-or-n-p)

;; 设置sentence-end可以识别中文标点
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;; 可以递归使用minibuffer
(setq enable-recursive-minibuffers t)

;; 防止页面滚动时跳动，scroll-margin 3
(setq scroll-margin 3
      scroll-conservatively 10000)

;; 把默认的major mode设置为 text-mode
(setq default-major-mode 'text-mode)

;; 括号匹配时显示另外一边的括号，而不是跳到另一个括号
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; 光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线
(mouse-avoidance-mode 'animate)
;; 设置光标为竖线
(setq-default cursor-type 'bar)
;; 设置光标为方块
;;(setq-default cursor-type 'box)

;; 使用 C-k 删除整行
(setq-default kill-whole-line t)

;; 让emacs可以直接打开和显示图片
(auto-image-file-mode)


;; 高亮显示要拷贝的区域
(transient-mark-mode t)

;; 把一些默认禁用的功能打开
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)

;; 设置备份时的版本控制
;; 所有的备份文件转移到~/backups目录下
(setq backup-directory-alist (quote (("." . "~/backups"))))
(setq backup-directory-alist '(("." . "~/backups")))
(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)
(setq backup-by-copying t)
;; Emacs 中，改变文件时，默认都会产生备份文件(以 ~ 结尾的文件)。可以完全去掉
;; (并不可取)，也可以制定备份的方式。这里采用的是，把所有的文件备份都放在一
;; 个固定的地方("~/var/tmp")。对于每个备份文件，保留最原始的两个版本和最新的
;; 五个版本。并且备份的时候，备份文件是复本，而不是原件
;; 如果不想自动备份文件，可以把上面的配置注释
;; 打开下面的配置：
;; 不自动生成备份文件
;; (setq-default make-backup-files nil)

;; 让 dired 可以递归地拷贝和删除目录
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)



;; 中文配置
;(set-language-environment 'Chinese-GB)
;(set-keyboard-coding-system 'euc-cn)
;(set-clipboard-coding-system 'euc-cn)
;;(set-terminal-coding-system 'euc-cn)
;(set-buffer-file-coding-system 'euc-cn)
;;(set-selection-coding-system 'euc-cn)
;(modify-coding-system-alist 'process "*" 'euc-cn)
;(setq default-process-coding-system 
;	'(euc-cn . euc-cn))
;===
;(setq-default pathname-coding-system 'euc-cn)
;(setq current-language-environment "UTF-8")
;(setq default-input-method "chinese-py")
;(setq locale-coding-system 'utf-8)
;(prefer-coding-system 'utf-8)
;==
(set-language-environment 'UTF-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
;(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8-unix)                     ;缓存文件编码
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(if wttr/os:windowsp
    (setq default-process-coding-system '(utf-8 . utf-8)))           ;windows 可以使用这个
(if wttr/os:linuxp
    (setq default-process-coding-system '(utf-8-unix . utf-8-unix))) ;进程输出输入编码 -- affect pdb on windows, linux 使用这个
(setq-default pathname-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8-unix)                       ;文件名编码
(setq default-sendmail-coding-system 'utf-8-unix)               ;发送邮件编码
(setq default-terminal-coding-system 'utf-8-unix)               ;终端编码


;;-------------ibuffer,查看bufer
(require 'ibuffer)
(global-set-key ( kbd "C-x C-b")' ibuffer)
;;自动重载更改的文件
(global-auto-revert-mode 1)

;;ido的配置,这个可以使你在用C-x C-f打开文件的时候在后面有提示;
;;这里是直接打开了ido的支持，在emacs23中这个是自带的.
(ido-mode t)

;;当你在shell、telnet、w3m等模式下时，必然碰到过要输入密码的情况,此时加密显出你的密码
(add-hook 'comint-output-filter-functions
      'comint-watch-for-password-prompt)

;;允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)

;; 自动的在文件末增加一新行
(setq require-final-newline t)

;;Non-nil if Transient-Mark mode is enabled.
(setq-default transient-mark-mode t)

;; 当光标在行尾上下移动的时候，始终保持在行尾。
(setq track-eol t)

;; 当浏览 man page 时，直接跳转到 man buffer。
(setq Man-notify-method 'pushy)

(setq speedbar-show-unknown-files t);;可以显示所有目录以及文件
;;(setq dframe-update-speed nil);;不自动刷新，手动 g 刷新
(setq speedbar-update-flag nil)
(setq speedbar-use-images nil);;不使用 image 的方式
(setq speedbar-verbosity-level 0)

;;让 dired 可以递归的拷贝和删除目录。
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

;; 设置时间戳，标识出最后一次保存文件的时间。
(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)
(setq time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S chenyang")
;; 启动最大化窗口设置
;windows
;(if wttr/os:windowsp
;    (defun w32-restore-frame ()
;    "Restore a minimized frame"
;    (interactive)
;    (w32-send-sys-command 61728))
;    (defun w32-maximize-frame ()
;    "Maximize the current frame"
;    (interactive)
;    (w32-send-sys-command 61488))
;    ;;;; Maximum Windows Frame
;    (w32-maximize-frame))
;linux
(if wttr/os:linuxp
	(setq initial-frame-alist '((top . 0) (left . 0) (width . 1600) (height . 900))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
