;; Clean UI
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; Load configs
(add-to-list 'load-path (concat user-emacs-directory "config"))

;; Require package manager
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives 
	     '("marmalade" . "http://marmalade-repo.org/packages/"))

;; from purcell/emacs.d
(defun require-package (package &optional min-version no-refresh)
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(package-initialize)

(require-package 'monokai-theme)
(require-package 'auto-complete)

(require 'erc)
(require 'dirtree)
(require 'auto-complete)
(require 'theme-and-looks)
(require 'ido)
(require 'init-evil)
(ido-mode t)
(setq ido-enable-flex-matching t)
(ido-everywhere t)

(show-paren-mode t)
(load-theme 'monokai t)

(setq ac-auto-show-menu t)
(setq ac-auto-start t)
(global-auto-complete-mode t)
(add-to-list 'ac-modes 'lisp-mode)

;; Shut up emacs i'm just starting
(setq ring-bell-function 'ignore)

;; Set line count
(global-linum-mode t)

(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq js2-highlight-level 3)

(global-set-key
     "\M-x"
     (lambda ()
       (interactive)
       (call-interactively
        (intern
         (ido-completing-read
          "M-x "
          (all-completions "" obarray 'commandp))))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-buffer-choice "~/")
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60)))
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(windmove-default-keybindings)
(setq windmove-wrap-around t)
