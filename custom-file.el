(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-delay 0.5)
 '(ac-trigger-key "")
 '(browse-url-browser-function (quote browse-url-chrome))
 '(create-lockfiles nil)
 '(custom-safe-themes
   (quote
    ("830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(fill-column 100)
 '(fringe-mode nil nil (fringe))
 '(global-undo-tree-mode t)
 '(highlight-indent-guides-method (quote character))
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
    (ivy json-mode projectile nix-mode auto-compile crystal-mode csharp-mode diff-hl direnv dockerfile-mode elm-mode exec-path-from-shell feature-mode git-commit go-mode haml-mode hl-todo julia-mode lua-mode magit markdown-toc neotree powershell rspec-mode ruby-hash-syntax sass-mode use-package yaml-mode markdown-mode udev-mode bicycle web-mode solarized-theme gnu-elpa-keyring-update ruby-additional ruby-end ruby-refactor rvm slim-mode toml-mode unicode-fonts markdown-mode+ go-autocomplete go-snippets golint gitattributes-mode gitconfig-mode gitignore-mode flymake-ruby rufo flycheck-julia undo-tree rnc-mode org minimap git-blame edit-server css-mode auto-highlight-symbol)))
 '(paradox-github-token t)
 '(ruby-flymake-use-rubocop-if-available nil)
 '(safe-local-variable-values
   (quote
    ((eval c-set-offset
           (quote inlambda)
           0)
     (eval c-set-offset
           (quote access-label)
           (quote -))
     (eval c-set-offset
           (quote substatement-open)
           0)
     (eval c-set-offset
           (quote arglist-cont-nonempty)
           (quote +))
     (eval c-set-offset
           (quote arglist-cont)
           0)
     (eval c-set-offset
           (quote arglist-intro)
           (quote +))
     (eval c-set-offset
           (quote inline-open)
           0)
     (eval c-set-offset
           (quote defun-open)
           0)
     (eval c-set-offset
           (quote innamespace)
           0)
     (indicate-empty-lines . t)
     (whitespace-line-column . 80)
     (eval when
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
 '(markdown-header-face-1 ((t (:foreground "#1e90ff" :weight bold))))
 '(markdown-header-face-2 ((t (:foreground "#1ea2ee" :weight bold))))
 '(markdown-header-face-3 ((t (:foreground "#1eb4dd" :weight bold))))
 '(markdown-header-face-4 ((t (:foreground "#1ec6cc" :weight bold))))
 '(markdown-header-face-5 ((t (:foreground "#1ed8bb" :weight bold))))
 '(org-level-1 ((t (:foreground "#1e90ff" :weight bold))))
 '(org-level-2 ((t (:foreground "#1ea2ee" :weight bold))))
 '(org-level-3 ((t (:foreground "#1eb4dd" :weight bold))))
 '(org-level-4 ((t (:foreground "#1ec6cc" :weight bold))))
 '(org-level-5 ((t (:foreground "#1ed8bb" :weight bold))))
 '(org-level-6 ((t (:foreground "#1eeaaa" :weight bold))))
 '(org-level-7 ((t (:foreground "#1efb99" :weight bold))))
 '(org-level-8 ((t (:foreground "#1eff88" :weight bold))))
 '(outline-1 ((t (:foreground "#1e90ff" :weight bold))))
 '(outline-2 ((t (:foreground "#1ea2ee" :weight bold))))
 '(outline-3 ((t (:foreground "#1eb4dd" :weight bold))))
 '(outline-4 ((t (:foreground "#1ec6cc" :weight bold))))
 '(outline-5 ((t (:foreground "#1ed8bb" :weight bold))))
 '(outline-6 ((t (:foreground "#1eeaaa" :weight bold))))
 '(outline-7 ((t (:foreground "#1efb99" :weight bold))))
 '(outline-8 ((t (:foreground "#1eff88" :weight bold)))))
