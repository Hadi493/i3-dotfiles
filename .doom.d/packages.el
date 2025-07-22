;;; packages.el --- Package configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; This file specifies additional packages to install

;;; Code:

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; Install packages directly from GitHub or other version control repositories
;; (package! some-package
;;   :recipe (:host github :repo "username/repo"))

;; Additional packages that might be useful for a Neovim user:

;; Better terminal support
(package! vterm)

;; Enhanced evil mode features
(package! evil-multiedit)
(package! evil-commentary)

;; Git integration enhancements
(package! git-gutter-fringe)

;; Additional text objects for evil mode
(package! evil-surround)
(package! evil-exchange)

;; Telescope-like functionality (already included with consult, but these add more)
(package! embark)
(package! marginalia)

;; Better which-key (already included but worth mentioning)
;; Shows available keybindings as you type

;; Language specific packages
;; Uncomment the ones you need:
;; (package! rust-mode)
;; (package! go-mode)
;; (package! python-mode)
;; (package! web-mode)
;; (package! yaml-mode)
;; (package! dockerfile-mode)

;;; packages.el ends here
