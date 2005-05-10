;;;;;;;;;;
;;;  emacs init file
;;;;;;;;;;
;;;
;;;  local emacs stuff (if any)
;;;
(setq load-path (append '("~/.elisp") load-path))
(load "mylocal")


;;;;;;;;;;
;;;  font-lock mode setup
;;;;;;;;;;
(add-hook 'font-lock-mode-hook
	  (function
	   (lambda ()
	     (setq font-lock-maximum-size nil)
;;;  comments
	     (set-face-foreground 'font-lock-comment-face "Blue")
	     (set-face-background 'font-lock-comment-face "Turquoise")
	     (set-face-italic-p 'font-lock-comment-face t)
;;;  literal strings
	     (set-face-foreground 'font-lock-string-face nil)
	     (set-face-background 'font-lock-string-face "MediumAquaMarine")
	     (set-face-underline-p 'font-lock-string-face nil) ; note underscores
;;;  keywords (like: static, const, new, this)
;;;  constants (like: true, false)
;;;  builtins (preprocessor imperatives like: include, ifdef)
	     (mapcar #'(lambda (face)
			 (set-face-foreground face nil)
			 (set-face-bold-p face t))
		     (list font-lock-keyword-face
			   font-lock-constant-face
			   font-lock-builtin-face))
;;;  types (doesn't work for most user-defined types)
	     (set-face-foreground 'font-lock-type-face nil)
	     (set-face-foreground 'font-lock-type-face "ForestGreen")
	     (set-face-bold-p 'font-lock-type-face t)
;;;  function names (definitions, declarations)
	     (set-face-foreground 'font-lock-function-name-face nil)
;;;  variable names (definitions, parameters)
	     (set-face-foreground 'font-lock-variable-name-face nil)
;;;  warnings
             (set-face-foreground 'font-lock-warning-face "White")
             (set-face-background 'font-lock-warning-face "Red")

;; in order, match one-line '[TODO ... ]', two-line '[TODO ...\n ... ]'
;; then one-line 'TODO ...'
             (font-lock-add-keywords
              nil ;; mode name
              '(("\\[\\(XXX\\|TODO\\|FIXME\\).*\\]\\|\\[\\(XXX\\|TODO\\|FIXME\\).*
?.*\\]\\|\\(XXX\\|TODO\\|FIXME\\).*$"
0 font-lock-warning-face t)))
	     )))

;;;;;;;;;;
;;; general variables, functions
;;;;;;;;;;
(line-number-mode t)
(transient-mark-mode t)
(setq default-major-mode 'text-mode) 
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(display-time)
(set-input-mode nil nil t) ; so we can use ALT as a META key (?)
(set-scroll-bar-mode 'right)
(setq-default indent-tabs-mode nil)
(cond ((commandp 'tool-bar-mode) (tool-bar-mode 0)))
(when window-system
  ;; enable wheelmouse support by default
  (mwheel-install))


;;;;;;;;;;
;;;  some random stuff.
;;;;;;;;;;
(autoload 'ediff "ediff" nil t)  ;  cool diff mode
(autoload 'flame "flame" nil t)  ;  automated flaming

;;;;;;;;;;
;;;  minibuffer resizes dynamically
;;;;;;;;;;
(autoload 'resize-minibuffer-mode "rsz-mini" nil t)
(resize-minibuffer-mode)

;;;;;;;;;;
;;; key bindings
;;;;;;;;;;
(global-set-key "\C-x\C-w" 'kill-rectangle) 
(global-set-key "\C-x\C-y" 'yank-rectangle) 
(global-set-key "\C-cg" 'goto-line) 
(global-set-key "\C-cr" 'replace-regexp) 
(global-set-key "\er" 'query-replace-regexp) 
(global-set-key "\C-c\C-a" 'auto-fill-mode)
; (global-set-key "\C-cd" 'spell-buffer)
(global-set-key "\C-cj" 'justify-current-line)
(global-set-key "\C-c\t" 'tab-to-tab-stop)
(global-set-key "\C-x\C-q" 'toggle-read-only)
(global-set-key "\C-co" 'my-find-other-file)
(global-set-key [\C-tab] 'yic-next-buffer)
(global-set-key [\S-tab] 'yic-prev-buffer)

;;;
;;; frame-related bindings
;;;
(global-set-key "\C-c\C-fo" 'other-frame)
(global-set-key "\C-c\C-fn" 'new-frame)
(global-set-key "\C-c\C-fd" 'delete-frame)
(global-set-key "\C-c\C-fs" 'speedbar)

(global-set-key "\C-c\C-c" 'comment-region)

;;;
;;;  these so we can resize buffer windows using the mouse
;;;
(require 'mldrag)
(global-set-key [mode-line down-mouse-1] 'mldrag-drag-mode-line)
(global-set-key [vertical-line down-mouse-1] 'mldrag-drag-vertical-line)
(global-set-key [vertical-scroll-bar S-down-mouse-1] 'mldrag-drag-vertical-line)

;;  prepend or replace a cons cell with given key
(defun my-unique-prepend (key val assoc)
  "Returns a copy of assoc with cons cell (key . val)."
  (let ((CELL (assq key assoc)))
    (cond ((consp CELL) (setcdr CELL val))
          ((push '(key . val) assoc)))))

;;;;;;;;;;
;;;  text-mode
;;;;;;;;;;
(add-hook 'text-mode-hook
          (function
           (lambda ()
             (cond (window-system (font-lock-mode t)))
             )))

;;;;;;;;;;
;;;  common c modes
;;;;;;;;;;
(add-hook 'c-mode-common-hook
	  (function
	   (lambda ()

;;; use tabs instead of spaces
	     (setq indent-tabs-mode t) ;;; nil forces spaces always
;;; set tabbing convention and display
	     (setq tab-width 4)
	     (c-set-style "stroustrup")
;;; make inline function definitions indent like i want
             (let ((CELL (assq 'inline-open c-offsets-alist)))
               (cond ((consp CELL) (setcdr CELL 0))
                     ((push '(inline-open . 0) c-offsets-alist))))
             (let ((CELL (assq 'inher-intro c-offsets-alist)))
               (cond ((consp CELL) (setcdr CELL 0))
                     ((push '(inher-intro . 0) c-offsets-alist))))

	     (auto-fill-mode)
	     (set-fill-column 80)

; c++-style comments 
             (fset 'my-cpp-comment-wide
                   [?\C-o tab ?/ ?/ escape ?9 ?* return tab ?/ ?/
                          return tab ?/ ?/ escape ?9 ?* ?\C-p ?  ? ])
             (fset 'my-cpp-comment
                   [?\C-o tab ?/ ?/ return tab ?/ ?/ return tab ?/ ?/
                          ?\C-p ?  ? ])
; c-style comments
             (fset 'my-c-comment-wide
                   [?\C-o tab ?/ escape ?1 ?0 ?* return ?* tab
                          return escape ?1 ?0 ?* ?/ ?\C-p ?  ? ])
             (fset 'my-c-comment
                   [?\C-o tab ?/ ?* return ?* tab return ?* ?/
                          ?\C-p ?  ? ])

             (fset 'my-c-dox-comment
                   [?\C-o tab ?/ ?* ?* return ?* tab return ?*
                          ?/ ?\C-p ?  ? ])
	     (local-set-key "\C-c\C-v" 'my-c-dox-comment)

;;; to override c-electric-star
	     (local-set-key "*" 'self-insert-command )

             (cond (window-system
                    (font-lock-mode)))

	     (hs-minor-mode 1)

	     )))

;;;;;;;;;;
;;; cc-mode (c-mode)
;;;;;;;;;;
(setq auto-mode-alist
      (append '(("\\.c$"  . c-mode)   ; to edit C code
		("\\.h$"  . c-mode)   ; to edit C code
		("\\.ec$" . c-mode)
		("\\.php$" . c-mode)
		) auto-mode-alist))
(add-hook 'c-mode-hook
	  (function
	   (lambda ()
             (local-set-key "\C-cc" 'my-c-comment-wide)
             (local-set-key "\C-cv" 'my-c-comment))))

;;;;;;;;;;
;;;  c++-mode
;;;;;;;;;;
(setq auto-mode-alist
      (append
       '(("\\.cpp\\'" . c++-mode))
       '(("\\.h\\'" . c++-mode))
       '(("\\.inl\\'" . c++-mode))
       '(("\\.dox\\'" . c++-mode))
       auto-mode-alist))
(add-hook 'c++-mode-hook
	  (function
	   (lambda ()
             (local-set-key "\C-cc" 'my-cpp-comment-wide)
             (local-set-key "\C-cv" 'my-cpp-comment))))


;;;;;;;;;;
;;;  cmake-mode
;;;;;;;;;;
(setq auto-mode-alist
      (append
       '(("\\.cmake\\'" . cmake-mode))
       '(("CMakeLists\\.txt\\'" . cmake-mode))
       auto-mode-alist))
(add-hook 'cmake-mode-hook
          (function
           (lambda ()
             ;;
             ;; this rocking one-line command makes '_' a word delimiter
             ;; just like in cc-mode
             ;;
             (modify-syntax-entry ?_  "_" )
             (cond (window-system
                    (font-lock-mode)))
)))


;;;;;;;;;;
;;;  java mode
;;;;;;;;;;
(add-hook 'java-mode-hook
	  (function
	   (lambda ()
             (local-set-key "\C-cc" 'my-cpp-comment-wide)
             (local-set-key "\C-cv" 'my-cpp-comment))))


;;;;;;;;;;
;;;  fortran mode
;;;;;;;;;;
(setq auto-mode-alist (cons '("\\.F$" . fortran-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.hf$" . fortran-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.inc$" . fortran-mode) auto-mode-alist))
(setq fortran-mode-hook
      '(lambda ()
	 (fortran-auto-fill-mode 72)
	 (abbrev-mode t)
	 (setq
	  fortran-comment-region "c"
	  fortran-comment-indent-style 'relative
	  fortran-blink-matching-if t
	  fortran-do-indent 2
	  fortran-if-indent 2
	  fortran-structure-indent 2
	  fortran-comment-line-extra-indent -2
	  fortran-continuation-indent 5
	  fortran-continuation-string ".")
         (fset 'fortranchow
               [67 32 32 32 67 104 111 119 32 114 117 108 101 115 return 42 tab escape 49 48 42])
         (fset 'my-fortran-comment1
               [15 escape 49 48 42 return 42 return escape 49 48 42 16
                   32 32]) 
         (fset 'my-fortran-comment2
               [15 42 32 escape 49 48 42 tab return 42 32 42 tab
                   return 42 32 escape 49 48 42 tab 16 32 32]) 
         (local-set-key "\C-cp" 'fortranchow)
	 (local-set-key "\C-cc" 'my-fortran-comment1)
	 (local-set-key "\C-cv" 'my-fortran-comment2)
;	 (cond (window-system
;		(setq hilit-mode-enable-list  '(fortran-mode)
;		      hilit-background-mode   'light
;		      hilit-auto-highlight    t
;		      hilit-inhibit-hooks     nil
;		      hilit-inhibit-rebinding nil)
;		(require 'hilit19)
;		))

	 ;;
	 ;; this rocking one-line command makes '_' a word delimiter
	 ;; just like in cc-mode
	 ;;
	 (modify-syntax-entry ?_  "_" )

         (cond (window-system (font-lock-mode 1)))

	 ))


;;;;;;;;;;
;;;  php-mode
;;;;;;;;;;
;(autoload 'php-mode "php-mode" "PHP editing mode" t)
;(add-to-list 'auto-mode-alist '("\\.php3\\'" . php-mode))
;(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))


;;;;;;;;;;
;;;  GOB files
;;;;;;;;;;
(add-to-list 'auto-mode-alist '("\\.gob\\'" . c-mode))


;;;;;;;;;;
;;; perl-mode
;;;;;;;;;;
;; (setq auto-mode-alist (append (list (cons "\\.pl$" 'cperl-mode))
;;                        auto-mode-alist))

;; (add-hook 'cperl-mode-hook
;; 	  (function
;; 	   (lambda ()
;;  	     (fset 'my-perl-comment
;;  		   [15 32 escape 49 48 35 tab return 32 35 tab return
;;  		       32 escape 49 48 35 tab 16 32 32])
;;  	     (fset 'my-perl-comment2
;;  		   (read-kbd-macro
;;  		    "C-o TAB # RET TAB # RET TAB # C-p C-e 2*SPC"))
;;  	     (local-set-key "\C-cc" 'my-perl-comment)
;;  	     (local-set-key "\C-cv" 'my-perl-comment2)
;; 	     (font-lock-mode 1)
;; 	     )))

(autoload 'perl-mode "perl-mode" "Perl mode." t)
(setq auto-mode-alist (append (list (cons "\\.pl$" 'perl-mode))
 			      auto-mode-alist))
(add-hook 'perl-mode-hook
 	  (function
 	   (lambda ()
 	     (setq
 	      perl-tab-to-comment nil
 	      perl-indent-level 2
 	      perl-continued-brace-offset -2
 	      perl-label-offset 0
 	      )
 	     (fset 'my-perl-comment
 		   [15 32 escape 49 48 35 tab return 32 35 tab return
 		       32 escape 49 48 35 tab 16 32 32])
 	     (fset 'my-perl-comment2
 		   (read-kbd-macro
 		    "C-o TAB # RET TAB # RET TAB # C-p C-e 2*SPC"))
 	     (local-set-key "\C-cc" 'my-perl-comment)
 	     (local-set-key "\C-cv" 'my-perl-comment2)
 	     (cond (window-system 
 		    (font-lock-mode 1)
 		    ))
 	     )))

;;;;;;;;;;
;;;  sh-mode
;;;;;;;;;;
(add-hook 'sh-mode-hook
          (function
           (lambda ()
             (fset 'my-sh-comment
                   [?# return ?# return ?# return ?\C-p ?\C-p ?\C-e ?  ? ])
             (local-set-key "\C-cv" 'my-sh-comment)
 	     (cond (window-system 
 		    (font-lock-mode 1)
 		    ))
)))


;;;;;;;;;;
;;; ksh mode
;;;;;;;;;;
; (autoload 'ksh-mode "ksh-mode" "Major mode for editing sh Scripts." t)
; (setq auto-mode-alist
;       (append auto-mode-alist
; 	      (list
; 	       '("\\.sh$" . ksh-mode)
; 	       '("\\.ksh$" . ksh-mode)
; 	       '("\\.kshrc$" . ksh-mode)
;                '("\\.bat" . ksh-mode)
;                '("\\..*profile" . ksh-mode)
; 	       )
; 	      ))

; (add-hook 'ksh-mode-hook
; 	  (function
; 	   (lambda ()
; 	     (setq 
; 	      ksh-indent 2
; 	      ksh-case-indent 4
; 	      ksh-case-item-offset 2
; 	      ksh-group-offset -2
; 	      ksh-brace-offset 0
; 	      ksh-multiline-offset 4
; 	      ksh-tab-always-indent t
; 	      ksh-match-and-tell t
; 	      ksh-align-to-keyword t
; 	      )
; 	     (fset 'my-ksh-comment
; 		   [15 escape 49 48 35 tab return 35 tab return
; 		       escape 49 48 35 tab 16 32 32])
; 	     (fset 'my-ksh-comment2
; 		   [15 35 tab return 35 tab return 35 tab 16 32 32])
; 	     (local-set-key "\C-cc" 'my-ksh-comment)
; 	     (local-set-key "\C-cv" 'my-ksh-comment2)
; 	     (cond (window-system 
; 		    (font-lock-mode 1)
; 		    ))
; 	     )))

;;;;;;;;;;
;;;  mail mode
;;;;;;;;;;
(autoload 'mail-comment-region "mailfunc" "" t)
(autoload 'mail-yank-and-comment-original "mailfunc" "" t)
(add-hook 'mail-mode-hook
	  (function
	   (lambda ()
	     (local-set-key "\C-i" "     ")
	     (local-set-key "\C-c;" 'mail-comment-region)
	     (local-set-key "\C-c\C-y" 'mail-yank-and-comment-original)
	     (auto-fill-mode)
	     (setq mail-self-blind t)
	     (setq mail-default-reply-to "mike@csa.net")
	     )))

;;;;;;;;;;
;;;  rmail mode
;;;;;;;;;;
(add-hook 'rmail-mode-hook
	  (function
	   (lambda ()
	     (setq 
	      next-screen-context-lines 5
	     )
	     )))
(setq rmail-file-name "~/.rmail/incoming")
(setq rmail-last-rmail-file "~/.rmail/received")
(setq rmail-default-rmail-file "~/.rmail/received")
(setq rmail-primary-inbox-list
      (append rmail-primary-inbox-list
	      (list "~/.rmail/MBOX" )
	      ))

;;;;;;;;;;
;;;  emacs-lisp mode
;;;;;;;;;;
(add-hook 'emacs-lisp-mode-hook
		  (function
		   (lambda ()
			 (fset 'my-lisp-comment
				   [15 escape 49 48 59 return 59 59 59 return escape
					   49 48 59 16 32 32])
			 (local-set-key "\C-cc" 'my-lisp-comment)
			 (font-lock-mode 1)
			 )))

;;;;;;;;;;
;;;  outline mode
;;;;;;;;;;
(add-hook 'outline-mode-hook
          (function
           (lambda ()
             (hide-body) ; hide everything except headings
             )))

;;;;;;;;;;
;;;  hideshow mode
;;;;;;;;;;
; (defun hs-my-show-level ()
;   "Show next level, hiding nested levels."
;   (interactive)
;   (hs-show-block)
;   (hs-hide-level 1))

(add-hook 'hs-minor-mode-hook
          (function
           (lambda ()
	     (setq hs-hide-comments-when-hiding-all nil)
	     (setq hs-isearch-open t)
	     (setq hs-show-hidden-short-form nil)
             (local-set-key "\C-cl" 'hs-hide-level)
             )))

;;;;;;;;;;
;;;  scheme mode
;;;;;;;;;;
(add-hook 'scheme-mode-hook
          (function
           (lambda ()
             (fset 'my-scheme-comment
                   [15 escape 49 48 59 return 59 59 59 return escape
                       49 48 59 16 32 32])
             (local-set-key "\C-cc" 'my-scheme-comment)
	     (font-lock-mode 1)
             )))

;;;;;;;;;;
;;;  texinfo mode
;;;;;;;;;;
(add-hook 'texinfo-mode-hook
          (function
           (lambda ()
	     (font-lock-mode 1)
             )))

;;;;;;;;;;
;;;  my ruler
;;;;;;;;;;
(defvar my-column-ruler
  (concat
   "        10        20        30        40"
   "        50        60        70        80\n"
   "    +    |    +    |    +    |    +    |"
   "    +    |    +    |    +    |    +    |\n")
  "*String displayed above current line by \\[my-column-ruler].")

(defun my-column-ruler ()
  "Inserts a column ruler momentarily above current line, till next keystroke.
The ruler is defined by the value of my-column-ruler.
The key typed is executed unless it is SPC."
  (interactive)
  (momentary-string-display 
   my-column-ruler (save-excursion (beginning-of-line) (point))
   nil "Type SPC or any command to erase ruler."))

(global-set-key "\C-c\C-r" 'my-column-ruler)


;;;;;;;;;;
;;;  these in case I am on an XON/OFF or really, really dumb terminal
;;;;;;;;;;
;(global-set-key "\C-cs" 'isearch-forward-regexp)
;(global-set-key "\C-\\" 'isearch-repeat-forward-regexp)
;(global-set-key "\C-c\C-c " 'set-mark-command) 

;;;;;;;;;;
;;;  my-find-other-file is intended to help browse lots of source files
;;;  my-load-if-exists is a helper function
;;;;;;;;;;
(defun my-load-if-exists (list)
  (cond (list
         (cond ((file-exists-p (car list))
                (find-file-other-window (car list)))
               ((my-load-if-exists (cdr list)))))
        ((error "Could not find a matching file."))))

(defun my-find-other-file ()
  "Given a source code file, will load the header file into a new buffer."
  (interactive)
  (let ((curbuf (buffer-name)))
    (cond ((string-match "\.cpp$" curbuf)
           (my-load-if-exists (list (replace-match ".h" t t curbuf))))
          ((string-match "\.c$" curbuf)
           (my-load-if-exists (list (replace-match ".h" t t curbuf))))
          ((string-match "\.inl$" curbuf)
           (my-load-if-exists (list (replace-match ".h" t t curbuf))))
          ((string-match "\.h$" curbuf)
           (my-load-if-exists (list (replace-match ".cpp" t t curbuf)
                                    (replace-match ".c" t t curbuf)
                                    (replace-match ".inl" t t curbuf)))
           ))))


;;;;;;;;;;
;;;  ripped off from yaroslav
;;;;;;;;;;
(defun yic-ignore (str)
  (or
   ;;buffers I don't want to switch to 
   (string-match "\\*Buffer List\\*" str)
   (string-match "^TAGS" str)
   (string-match "^\\*Messages\\*$" str)
   (string-match "^\\*Completions\\*$" str)
   (string-match "^ " str)

   ;;Test to see if the window is visible on an existing visible frame.
   ;;Because I can always ALT-TAB to that visible frame, I never want to 
   ;;Ctrl-TAB to that buffer in the current frame.  That would cause 
   ;;a duplicate top-level buffer inside two frames.
   (memq str		   
	 (mapcar 
	  (lambda (x) 
	    (buffer-name 
	     (window-buffer 
	      (frame-selected-window x))))
	  (visible-frame-list)))
   ))

(defun yic-next (ls)
  "Switch to next buffer in ls skipping unwanted ones."
  (let* ((ptr ls)
	 bf bn go
	 )
    (while (and ptr (null go))
      (setq bf (car ptr)  bn (buffer-name bf))
      (if (null (yic-ignore bn))	;skip over
	  (setq go bf)
	(setq ptr (cdr ptr))
	)
      )
    (if go
	(switch-to-buffer go))))

(defun yic-prev-buffer ()
  "Switch to previous buffer in current window."
  (interactive)
  (yic-next (reverse (buffer-list))))

(defun yic-next-buffer ()
  "Switch to the other buffer (2nd in list-buffer) in current window."
  (interactive)
  (bury-buffer (current-buffer))
  (yic-next (buffer-list)))
