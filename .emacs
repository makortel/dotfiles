;; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

(set-default-font "7x13")
; http://superuser.com/questions/210555/emacs-font-settings-not-working-in-new-frame
(add-to-list 'default-frame-alist
             '(font . "7x13"))

;; turn on font-lock mode
;(when (fboundp 'global-font-lock-mode)
;  (global-font-lock-mode t))

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" system-name))

(tool-bar-mode 0)
(blink-cursor-mode 0)
(setq inhibit-startup-message t)
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(show-paren-mode t)
(setq show-paren-delay 0)
(setq-default indent-tabs-mode nil)

(when (null window-system)
  (menu-bar-mode 0))

(set-keyboard-coding-system 'utf-8)
(setq mouse-yank-at-point t)

(setq sentence-end-double-space nil
      sentence-end "[.?!][]\"')]*\\($\\|\t\\| \\)[ \t\n]*"
      colon-double-space nil)

(setq scroll-bar-mode-explicit t) 
(set-scroll-bar-mode `right)

;; color theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-dark-laptop)

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

;; set autosave directory for tramp
(setq tramp-auto-save-directory "~/.emacs.d/tramp-autosave")

;; http://stackoverflow.com/questions/1229142/how-can-i-save-my-mini-buffer-history-in-emacs
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))

;; Add local lisp folder to load-path
;(setq load-path (append load-path (list "~/elisp")))

;; Set up matlab-mode to load on .m files
;(autoload 'matlab-mode "matlab" "Enter MATLAB mode." t)
;(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
;(autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)

;; Customization:
;(setq matlab-indent-function t)        ; if you want function bodies indented
;; (setq matlab-verify-on-save-flag nil) ; turn off auto-verify on save
;; (defun my-matlab-mode-hook ()
;;   (setq fill-column 76))                ; where auto-fill should wrap
;; (add-hook 'matlab-mode-hook 'my-matlab-mode-hook)
;(defun my-matlab-shell-mode-hook ()
;  '())
;(add-hook 'matlab-shell-mode-hook 'my-matlab-shell-mode-hook)

;; Turn off Matlab desktop
;(setq matlab-shell-command-switches '("-nojvm"))


;; Asymptote

;; (add-to-list 'load-path "/home/mjkortel/asymptote/share/asymptote")
;; (autoload 'asy-mode "asy-mode.el" "Asymptote major mode." t)
;; (autoload 'lasy-mode "asy-mode.el" "hybrid Asymptote/Latex major mode." t)
;; (autoload 'asy-insinuate-latex "asy-mode.el" "Asymptote insinuate LaTeX." t)
;; (add-to-list 'auto-mode-alist '("\\.asy$" . asy-mode))
