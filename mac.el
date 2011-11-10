;; change command to meta, and ignore option to use weird norwegian keyboard
(setq mac-option-modifier 'none)
(setq mac-command-modifier 'meta)

;; mac friendly font
(set-face-attribute 'default nil :font "Monaco-16")

;; make sure path is correct when launched as application
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(push "/usr/local/bin" exec-path)

;; keybinding to toggle full screen mode
(global-set-key (quote [M-f10]) (quote ns-toggle-fullscreen))

;; Move to trash when deleting stuff
(setq delete-by-moving-to-trash t
      trash-directory "~/.Trash/emacs")

(provide 'mac)