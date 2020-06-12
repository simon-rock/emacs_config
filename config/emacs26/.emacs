;;emacs参数
;; -nw 不使用图形界面 -no-window
;; -q  不加载配置文件
;; --debug-init
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(case-fold-search nil)
 '(ecb-options-version "2.40"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; windows only
;(setenv "HOME" "E:/emacs-23.2")
;;(setenv "PATH" "D:/tools/emacs-23.2") ;; 会覆盖环境变量PATH,不能添加
;;set the default file path

;; 设置工作目录
;;windows
;(setq default-directory "D:/python_workspace")
;(require 'grep) ;; 
;;(setq grep-program "D:/MinGW/msys/1.0/bin/grep.exe")  
;(setq find-program "D:\\MinGW\\msys\\1.0\\bin\\find.exe") 
;;linux
(setq default-directory "~/workspace")

;; 设置 添加Emacs搜索路径
(setq load-path (cons "~/.emacs.d/elisp" load-path)) 
(setq load-path (cons "~/.emacs.d/elisp/dired" load-path))

;; 配色方案 ;; 添加el的路径
(setq load-path (append load-path (list "~/.emacs.d/elisp/color-theme-6.6.0")))
(setq load-path (append load-path (list "~/.emacs.d/elisp/si-color-theme")))
;; YASnippet 添加el的路径
(setq load-path (append load-path (list "~/.emacs.d/elisp/yasnippet-0.6.1c")))

;;auto-complete
;(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "~/.emacs.d/elisp/auto-complete-1.3.1")

;;------------------------cedet+ecb---------------------
;;--------cygwin
;(setenv "PATH" (concat "c:/cygwin/bin;" (getenv "PATH"))) 
;(setq exec-path (cons "c:/cygwin/bin" exec-path)) 
;(require 'cygwin-mount) 
;(cygwin-mount-activate) 

;(add-hook 'comint-output-filter-functions                                       
;                    'shell-strip-ctrl-m nil t)                                                  
;(add-hook 'comint-output-filter-functions                                       
;                    'comint-watch-for-password-prompt nil t)                                    
;(setq explicit-shell-file-name "bash.exe")                                      
;;; For subprocesses invoked via the shell                                       
;;; (e.g., "shell -c command")                                                   
;(setq shell-file-name explicit-shell-file-name) 
;(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;cedet
;(load-file "~/.emacs.d/install/cedet-1.0/common/cedet.el")
;(require 'cedet)

;;ecb
;(add-to-list 'load-path "~/.emacs.d/install/ecb-2.40")
;(require 'ecb)

;;git-emacs
(add-to-list 'load-path "~/.emacs.d/elisp/git-emacs")

(setq load-path (append load-path (list "~/.emacs.d/elisp/codepilot")))
(load-file "~/.emacs.d/elisp/base.el")
(load-file "~/.emacs.d/elisp/siexpand.el")
(load-file "~/.emacs.d/elisp/sicode.el")
(load-file "~/.emacs.d/elisp/sikey.el")
;(load-file "~/.emacs.d/elisp/sipython.el")
;(load-file "~/.emacs.d/elisp/sierlang.el")
(load-file "~/.emacs.d/elisp/sic++.el")
;(load-file "~/.emacs.d/elisp/silua.el")
;(load-file "~/.emacs.d/elisp/sigo.el")  // config for go

(load-file "~/.emacs.d/elisp/cmake-mode.el")
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'" . cmake-mode))
              auto-mode-alist))

