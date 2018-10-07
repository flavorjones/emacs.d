;;; magit-topgit-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "magit-topgit" "magit-topgit.el" (23482 1038
;;;;;;  880187 80000))
;;; Generated autoloads from magit-topgit.el

(autoload 'magit-topgit-mode "magit-topgit" "\
TopGit support for Magit.

\(fn &optional ARG)" t nil)

(custom-add-option 'magit-mode-hook #'magit-topgit-mode)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; magit-topgit-autoloads.el ends here
