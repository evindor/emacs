(require-package 'evil)
(require-package 'evil-leader)
(require 'evil-leader)
(global-evil-leader-mode)
(setq evil-search-module 'evil-search
      evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state t)

(evil-leader/set-leader ",")
(evil-leader/set-key
  "r" 'dired
  "e" (kbd "C-x C-e")
  "E" (kbd "C-M-x")
  "b" 'switch-to-buffer
  "f" 'find-file
  "d" 'kill-this-buffer
  "v" (kbd "C-w v C-w l")
  "s" (kbd "C-w s C-w j")
  "h" 'helm-mini
  "l" 'whitespace-mode)
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)
(require 'evil)
(evil-mode t)
(provide 'init-evil)
