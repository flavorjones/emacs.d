;;; rubocopfmt-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "rubocopfmt" "rubocopfmt.el" (0 0 0 0))
;;; Generated autoloads from rubocopfmt.el

(autoload 'rubocopfmt "rubocopfmt" "\
Format the current buffer with rubocop.

\(fn)" t nil)

(autoload 'rubocopfmt-mode "rubocopfmt" "\
Enable format-on-save for `ruby-mode' buffers via rubocopfmt.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "rubocopfmt" '("rubocopfmt-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; rubocopfmt-autoloads.el ends here
