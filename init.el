;;; Begin initialization

;;; Set up package
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
	      '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
(package-initialize)

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
  


(windmove-default-keybindings)

;; initial window
(setq initial-frame-alist
      '(
        (width . 220) ; character
        (height . 70) ; lines
        ))

;; default/sebsequent window
(setq default-frame-alist
      '(
        (width . 220) ; character
        (height . 70) ; lines
        ))
