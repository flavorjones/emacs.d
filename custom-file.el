(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-delay 0.5)
 '(ac-trigger-key "")
 '(create-lockfiles nil)
 '(custom-safe-themes
   (quote
    ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(fringe-mode nil nil (fringe))
 '(global-undo-tree-mode t)
 '(inhibit-startup-screen t)
 '(initial-major-mode (quote gfm-mode))
 '(initial-scratch-message "# scratch buffer
")
 '(js2-auto-indent-flag nil)
 '(js2-enter-indents-newline nil)
 '(js2-mirror-mode nil)
 '(js2-mode-indent-ignore-first-tab t)
 '(neo-keymap-style (quote concise))
 '(neo-smart-open t)
 '(org-agenda-files (quote ("~/docs/notes/todo.org")))
 '(org-file-apps
   (quote
    (("txt" . emacs)
     ("tex" . emacs)
     ("ltx" . emacs)
     ("org" . emacs)
     ("el" . emacs)
     ("bib" . emacs)
     ("pdf" . "evince '%s'"))))
 '(org-hide-leading-stars t)
 '(org-log-done (quote time))
 '(org-odd-levels-only t)
 '(org-startup-folded (quote content))
 '(package-selected-packages
   (quote
    (lua-mode rspec-mode ruby-additional ruby-end ruby-hash-syntax ruby-refactor rvm sass-mode slim-mode toml-mode unicode-fonts markdown-mode+ markdown-toc go-autocomplete go-snippets golint gitattributes-mode gitconfig-mode gitignore-mode flymake-ruby feature-mode exec-path-from-shell elm-mode direnv yaml-mode yasnippet rufo dockerfile-mode flycheck-julia julia-mode hl-todo diff-hl magit crystal-mode solarized-theme go-mode neotree undo-tree rnc-mode powershell org minimap git-blame flycheck find-file-in-project edit-server css-mode csharp-mode auto-highlight-symbol auto-compile)))
 '(paradox-github-token t)
 '(safe-local-variable-values
   (quote
    ((eval when
           (fboundp
            (quote rainbow-mode))
           (rainbow-mode 1))
     (require-final-newline . t)
     (mangle-whitespace . t)
     (encoding . utf-8)
     (ruby-compilation-executable . "ruby")
     (ruby-compilation-executable . "ruby1.8")
     (ruby-compilation-executable . "ruby1.9")
     (ruby-compilation-executable . "rbx")
     (ruby-compilation-executable . "jruby"))))
 '(sh-basic-offset 2)
 '(undo-tree-visualizer-diff t)
 '(undo-tree-visualizer-timestamps t)
 '(visual-line-fringe-indicators (quote (nil right-curly-arrow))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(escape-glyph ((t (:foreground "dim gray"))))
 '(outline-1 ((t (:foreground "#1e90ff" :weight bold))))
 '(outline-2 ((t (:foreground "#1ea2ee" :weight bold))))
 '(outline-3 ((t (:foreground "#1eb4dd" :weight bold))))
 '(outline-4 ((t (:foreground "#1ec6cc" :weight bold))))
 '(outline-5 ((t (:foreground "#1ed8bb" :weight bold))))
 '(outline-6 ((t (:foreground "#1eeaaa" :weight bold))))
 '(outline-7 ((t (:foreground "#1efb99" :weight bold))))
 '(outline-8 ((t (:foreground "#1eff88" :weight bold)))))
