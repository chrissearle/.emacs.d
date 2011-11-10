;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; Allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t)

;; Lines should be 80 characters wide, not 72
(setq fill-column 80)

;; Transparently open compressed files
(auto-compression-mode t)

;; Enable syntax highlighting for older Emacsen that have it off
(global-font-lock-mode t)

;; Misc
(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines t)
(set-default 'imenu-auto-rescan t)
(mouse-wheel-mode t)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Trailing white-space. Just say no.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Load path
(add-to-list 'load-path "~/.emacs.d/")

(require 'orgmode)
(when (equal system-type 'darwin)
  (require 'mac))

;; Add parts of each file's directory to the buffer name if not unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'dired-x)