;;; config.el --- Personal configuration -*- lexical-binding: t; -*-
;;; Commentary:
;;; Doom Emacs configuration optimized for Neovim users

;;; Code:

;; Personal information
(setq user-full-name "Your Name"
      user-mail-address "your.email@example.com")

;; Theme and appearance
(setq doom-theme 'doom-one  ; Dark theme similar to Neovim defaults
      doom-font (font-spec :family "JetBrains Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 14))

;; Line numbers (like Neovim's relativenumber)
(setq display-line-numbers-type 'relative)

;; Evil mode settings (Vim-like behavior)
(setq evil-want-fine-undo t
      evil-vsplit-window-right t
      evil-split-window-below t)

;; Make ESC quit more things (like in Vim)
(global-set-key [escape] 'keyboard-escape-quit)

;; Neovim-like window navigation
(map! :map evil-window-map
      "h" #'evil-window-left
      "j" #'evil-window-down
      "k" #'evil-window-up
      "l" #'evil-window-right)

;; Leader key mappings (SPC is default, like Neovim with Space leader)
(map! :leader
      ;; File operations
      "f f" #'find-file
      "f s" #'save-buffer
      "f S" #'save-some-buffers
      "f r" #'consult-recent-file
      
      ;; Buffer operations
      "b b" #'consult-buffer
      "b k" #'kill-current-buffer
      "b n" #'next-buffer
      "b p" #'previous-buffer
      
      ;; Search and replace
      "s s" #'consult-line
      "s p" #'consult-ripgrep
      "s r" #'query-replace
      
      ;; Git operations
      "g g" #'magit-status
      "g b" #'magit-branch-checkout
      "g l" #'magit-log-current
      
      ;; Project operations
      "p f" #'projectile-find-file
      "p p" #'projectile-switch-project
      "p g" #'consult-ripgrep
      
      ;; Window operations
      "w h" #'evil-window-left
      "w j" #'evil-window-down
      "w k" #'evil-window-up
      "w l" #'evil-window-right
      "w v" #'evil-window-vsplit
      "w s" #'evil-window-split
      "w d" #'delete-window
      "w o" #'delete-other-windows
      
      ;; LSP operations
      "c d" #'lsp-find-definition
      "c D" #'lsp-find-declaration
      "c i" #'lsp-find-implementation
      "c r" #'lsp-find-references
      "c R" #'lsp-rename
      "c a" #'lsp-execute-code-action
      "c f" #'lsp-format-buffer
      "c h" #'lsp-describe-thing-at-point)

;; Neovim-like auto-save behavior
(setq auto-save-default t
      auto-save-timeout 20
      auto-save-interval 200)

;; Better defaults
(setq-default
 delete-by-moving-to-trash t          ; Delete files to trash
 window-combination-resize t          ; Resize windows proportionally
 x-stretch-cursor t)                  ; Stretch cursor to glyph width

(setq undo-limit 80000000             ; Raise undo-limit to 80Mb
      evil-want-fine-undo t           ; By default while in insert all changes are one big blob
      auto-save-default t             ; Nobody likes to lose work, I certainly don't
      truncate-string-ellipsis "…"    ; Unicode ellipses are nicer than "..."
      scroll-preserve-screen-position 'always  ; Don't have `point' jump around
      scroll-margin 2)                ; It's nice to maintain a little margin

;; Make movement keys work like they should
(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)

;; Company (completion) settings
(after! company
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 2
        company-show-numbers t)
  (map! :map company-active-map
        "C-j" #'company-select-next
        "C-k" #'company-select-previous))

;; LSP settings
(after! lsp-mode
  (setq lsp-auto-guess-root t
        lsp-prefer-flymake nil
        lsp-file-watch-threshold 2000
        lsp-semantic-tokens-enable t
        lsp-enable-folding t
        lsp-enable-imenu t
        lsp-enable-snippet t
        lsp-eldoc-render-all t
        lsp-idle-delay 0.5
        lsp-log-io nil)) ; Set to t for debugging LSP issues

;; LSP UI settings
(after! lsp-ui
  (setq lsp-ui-peek-enable t
        lsp-ui-doc-enable t
        lsp-ui-doc-header t
        lsp-ui-doc-include-signature t
        lsp-ui-doc-position 'top
        lsp-ui-doc-delay 0.5
        lsp-ui-sideline-enable nil
        lsp-ui-imenu-enable t
        lsp-ui-flycheck-enable t))

;; Org-mode settings (if you use it)
(after! org
  (setq org-directory "~/org/"
        org-agenda-files '("~/org/")
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-ellipsis " ▼ "
        org-log-done 'time
        org-journal-dir "~/org/journal/"
        org-journal-date-format "%B %d, %Y (%A)"
        org-journal-file-format "%Y-%m-%d.org"
        org-hide-emphasis-markers t))

;; Treemacs (file explorer) settings
(after! treemacs
  (setq treemacs-width 30))

;; Terminal/shell settings
(setq shell-file-name (executable-find "bash"))    ; Use bash for internal shell processes
(setq-default vterm-shell "/bin/fish")             ; Use fish for terminal emulators
(setq-default explicit-shell-file-name "/bin/fish") ; Use fish for explicit shell

;;; config.el ends here
