;;;;
;; Packages
;;;;

;; Define package repositories
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "http://stable.melpa.org/packages/") t)


;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                          ("marmalade" . "http://marmalade-repo.org/packages/")
;;                          ("melpa" . "http://melpa-stable.milkbox.net/packages/")))


;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

;; Define he following variables to remove the compile-log warnings
;; when defining ido-ubiquitous
(defvar ido-cur-item nil)
(defvar ido-default-item nil)
(defvar ido-cur-list nil)
(defvar predicate nil)
(defvar inherit-input-method nil)

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:
(defvar my-packages
  '(;; makes handling lisp expressions much, much easier
    ;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
    paredit

    ;; key bindings and code colorization for Clojure
    ;; https://github.com/clojure-emacs/clojure-mode
    clojure-mode

    ;; extra syntax highlighting for clojure
    clojure-mode-extra-font-locking

    ;; integration with a Clojure REPL
    ;; https://github.com/clojure-emacs/cider
    cider

    ;; allow ido usage in as many contexts as possible. see
    ;; customizations/navigation.el line 23 for a description
    ;; of ido
    ido-ubiquitous

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; project navigation
    projectile

    ;; colorful parenthesis matching
    rainbow-delimiters

    ;; edit html tags like sexps
    tagedit

    ;; git integration
    magit

    ;; swap buffers in windows
    buffer-move

    ;; working with json
    json-mode
    ))

;; List of existing installed packages RaduW 16.07.2017
;;(buffer-move cider queue pkg-info epl dash clojure-mode clojure-mode-extra-font-locking
;; clojure-mode exec-path-from-shell ido-ubiquitous json-mode json-snatcher json-reformat
;; json-reformat json-snatcher magit git-rebase-mode git-commit-mode paredit projectile
;; pkg-info epl dash s queue rainbow-delimiters smex tagedit dash s)

;; On OS X, an Emacs instance started from the graphical user
;; interface will have a different environment than a shell in a
;; terminal window, because OS X does not run a shell during the
;; login. Obviously this will lead to unexpected results when
;; calling external utilities like make from Emacs.
;; This library works around this problem by copying important
;; environment variables from the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;; 
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
(add-to-list 'load-path "~/.emacs.d/vendor")


;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
;; (load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
;; (load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")

;; Langauage-specific
(load "setup-clojure.el")
(load "setup-js.el")

(when window-system
  (tool-bar-mode -1))

(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(global-set-key (kbd "C-x g") 'magit-status)


;; initial window
(setq initial-frame-alist
      '(
        (width . 240) ; character
        (height . 75) ; lines
        ))

;; default/sebsequent window
(setq default-frame-alist
      '(
        (width . 240) ; character
        (height . 75) ; lines
        ))
(set-face-attribute 'default nil :height 100)

;;RaduW enable auto indentation in lisp mode
;; (add-hook 'lisp-mode-hook '(lambda ()
;;   (local-set-key (kbd "RET") 'paredit-newline)))
(electric-indent-mode +1)

(setq default-directory "/data/raduwHome/")

;; window navigation with S-arrow
(windmove-default-keybindings)

;; buffer swapping with C-S-arrow
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

(global-set-key (kbd "<C-left>") 'left-word)
(global-set-key (kbd "<C-right>") 'right-word)

(defun insert-tab ()
  (interactive)
  (insert "\t"))

(global-set-key (kbd "<C-tab>") `insert-tab)
(setq tab-width 4)

;; navigate to  dired directory in the same buffer as previous
(put 'dired-find-alternate-file 'disabled nil)

(eval-after-load "paredit"
  '(progn
     (define-key paredit-mode-map (kbd "<C-left>") 'left-word)
     (define-key paredit-mode-map (kbd "<C-right>") 'right-word))
)

;; duplicate line Begin
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  )
(global-set-key (kbd "C-c C-d") 'duplicate-line)
;; duplicate line End
