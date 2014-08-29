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
(unless (null window-system)
  (require 'color-theme)
  (color-theme-initialize)
  (color-theme-dark-laptop))

(unless (null window-system)
  (load "auctex.el" nil t t)
  (load "preview-latex.el" nil t t))

(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

;; set autosave directory for tramp
(setq tramp-auto-save-directory "~/.emacs.d/tramp-autosave")
;; http://www.emacswiki.org/emacs/TrampMode#toc2
;; Faster than the default scp
(setq tramp-default-method "ssh")

;; http://stackoverflow.com/questions/1229142/how-can-i-save-my-mini-buffer-history-in-emacs
;; http://ergoemacs.org/emacs/elisp_check_defined.html
(when (fboundp 'savehist-mode)
  (setq savehist-file "~/.emacs.d/savehist")
  (savehist-mode 1)
  (setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring)))

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

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.icc\\'" . c++-mode))

;; http://stackoverflow.com/questions/8549351/c11-mode-or-settings-for-emacs
(require 'font-lock)
(defun --copy-face (new-face face)
  "Define NEW-FACE from existing FACE."
  (copy-face face new-face)
  (eval `(defvar ,new-face nil))
  (set new-face new-face))
(--copy-face 'font-lock-label-face  ; labels, case, public, private, proteced, namespace-tags
         'font-lock-keyword-face)
(--copy-face 'font-lock-doc-markup-face ; comment markups such as Javadoc-tags
         'font-lock-doc-face)
(--copy-face 'font-lock-doc-string-face ; comment markups
         'font-lock-comment-face)
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(add-hook 'c++-mode-hook
      '(lambda()
        (font-lock-add-keywords
         nil '(;; complete some fundamental keywords
           ("\\<\\(void\\|unsigned\\|signed\\|char\\|short\\|bool\\|int\\|long\\|float\\|double\\)\\>" . font-lock-keyword-face)
           ;; add the new C++11 keywords
           ("\\<\\(alignof\\|alignas\\|constexpr\\|decltype\\|noexcept\\|nullptr\\|static_assert\\|thread_local\\|override\\|final\\)\\>" . font-lock-keyword-face)
           ("\\<\\(char[0-9]+_t\\)\\>" . font-lock-keyword-face)
           ;; PREPROCESSOR_CONSTANT
           ("\\<[A-Z]+[A-Z_]+\\>" . font-lock-constant-face)
           ;; hexadecimal numbers
           ("\\<0[xX][0-9A-Fa-f]+\\>" . font-lock-constant-face)
           ;; integer/float/scientific numbers
           ("\\<[\\-+]*[0-9]*\\.?[0-9]+\\([ulUL]+\\|[eE][\\-+]?[0-9]+\\)?\\>" . font-lock-constant-face)
           ;; user-types (customize!)
           ("\\<[A-Za-z_]+[A-Za-z_0-9]*_\\(t\\|type\\|ptr\\)\\>" . font-lock-type-face)
           ("\\<\\(xstring\\|xchar\\)\\>" . font-lock-type-face)
           ))
        ) t)
