(require-package 'evil)
(require-package 'evil-leader)
(require 'evil-leader)
(global-evil-leader-mode)
(setq evil-search-module 'evil-search
      evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state t)

  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "r" 'sr-speedbar-toggle
    "e" (kbd "C-x C-e")
    ", e" (kbd "C-M-x")
    "E" (kbd "C-M-x")
    "b" 'buffer-menu
    "d" 'kill-this-buffer
    "v" (kbd "C-w v C-w l")
    "s" (kbd "C-w s C-w j")
    "h" help-map
    "h h" 'help-for-help-internal)
(require 'evil)
(evil-mode t)
(provide 'init-evil)
