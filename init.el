;;; Begin initialization

;;; Set up package
(require 'package)
(package-initialize)
;; (add-to-list 'package-archives
;;              '("melpa" . "http://melpa.org/packages/") t)
;; (add-to-list 'package-archives
;; 	      '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
;;; Bootstrap use-package
;; Install use-package if it's not already installed.
;; use-package is used to configure the rest of the packages.
;;(unless (package-installed-p 'use-package)
;;  (package-refresh-contents)
;;  (package-install 'use-package))

;;(eval-when-compile
;;  (require 'use-package))
;;(require 'diminish)                ;; if you use :diminish
;;(require 'bind-key)
;;(setq use-package-verbose t)

;;; Load the config
;;(org-babel-load-file (concat user-emacs-directory "config.org"))

(when window-system
  (tool-bar-mode -1))

(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(global-set-key (kbd "C-x g") 'magit-status)


(windmove-default-keybindings)

;; initial window
(setq initial-frame-alist
      '(
        (width . 140) ; character
        (height . 50) ; lines
        ))

;; default/sebsequent window
(setq default-frame-alist
      '(
        (width . 140) ; character
        (height . 50) ; lines
        ))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (magit org typescript-mode markdown-mode clojure-mode csharp-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(set-face-attribute 'default nil :height 80)

(global-set-key (kbd "C-x g") 'magit-status)
