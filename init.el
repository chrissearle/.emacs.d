;; With lots taken from https://github.com/magnars/.emacs.d ;)

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

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
(fset 'yes-or-no-p 'y-or-n-p)

;; Trailing white-space. Just say no.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Load path
(add-to-list 'load-path dotfiles-dir)

;; Encryption
(require 'encryption)

;; Org
(require 'orgmode)

;; Groovy/Gradle
(require 'groovy-init)

;; Mac
(when (equal system-type 'darwin)
  (require 'mac))

;; Mustache
(require 'mustache-mode)
(add-to-list 'auto-mode-alist '("\\.mustache$" . mustache-mode))

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))


;; Add parts of each file's directory to the buffer name if not unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Dired
(require 'dired-x)

;; Backups
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (concat dotfiles-dir "backups")))))

;; Remove restrictions
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(require 'magit)
(require 'magit-svn)

(setq load-path (cons (expand-file-name "~/.emacs.d/emacs-rails-reloaded") load-path))
(require 'rails-autoload)

(defun create-scratch-buffer nil
  "create a new scratch buffer to work in. (could be *scratch* - *scratchX*)"
  (interactive)
  (let ((n 0)
        bufname)
    (while (progn
             (setq bufname (concat "*scratch"
                                   (if (= n 0) "" (int-to-string n))
                                   "*"))
             (setq n (1+ n))
             (get-buffer bufname)))
    (switch-to-buffer (get-buffer-create bufname))
    (emacs-lisp-mode)
    ))
