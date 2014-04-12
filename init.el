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

(require-package 'evil)
(require-package 'sr-speedbar)
(require-package 'monokai-theme)
(require-package 'auto-complete)

(setq evil-search-module 'evil-search
      evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state t)

(require 'evil)
(require 'auto-complete)
(evil-mode t)

(show-paren-mode t)
(load-theme 'monokai t)

(setq ac-auto-show-menu t)
(setq ac-auto-start t)
(global-auto-complete-mode t)
(add-to-list 'ac-modes 'lisp-mode)

;; Shut up emacs i'm just starting
(setq bell-volume 0)

;; Set line count
(global-linum-mode t)
