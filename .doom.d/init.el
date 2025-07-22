;; init.el --- Doom Emacs configuration entry point.
;;; Commentary:
;;; This file controls what Doom modules are enabled and what order they load in.
;;; Press 'SPC h d h' to access Doom's documentation.

(doom! :input
       ;;bidi   ; (tfel ot) thgir etirw lanoitanretni

       :completion
       (company +tng)           ; auto-completion backend
       (vertico +icons)         ; the search engine of the future

       :ui
       doom                    ; what makes DOOM look the way it does
       doom-dashboard          ; a nifty splash screen for Emacs
       hl-todo                 ; highlight TODO/FIXME/NOTE tags
       modeline                ; a snazzy Atom-inspired modeline, plus API
       ophints                 ; display visual hints
       (popup +defaults)       ; tame sudden yet inevitable temporary windows
       (vc-gutter +pretty)     ; vcs diff in the fringe
       workspaces              ; tab emulation, persistence & separate workspaces
       zen                     ; distraction-free coding

       :editor
       (evil +everywhere); come to the dark side, we have cookies
       file-templates       ; auto-snippets for empty files
       fold                 ; the two modes on windows are:
       format               ; automated prettiness
       snippets             ; my elves. They type so I don't have to

       :emacs
       (dired +icons)       ; making dired pretty [functional]
       undo                 ; persistent, smarter undo for your inevitable mistakes

       :tools
       (lsp +peek)          ; Language Server Protocol support
       magit                ; a git porcelain for Emacs
       
       :lang
       (cc +lsp)            ; C/C++/Obj-C madness
       emacs-lisp           ; the lisp powering doom
       json                 ; At least it ain't XML
       markdown             ; writing docs for people to ignore
       nasm                 ; assembly crufts
       python               ; beautiful is better than ugly
       sh                   ; she sells {ba,z,fi}sh shells on the C xor
       web                  ; the tubes
       yaml                 ; JSON, but readable

       :config
       (default +bindings +smartparens))
