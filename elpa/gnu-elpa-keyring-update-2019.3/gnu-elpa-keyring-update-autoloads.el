;;; gnu-elpa-keyring-update-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "gnu-elpa-keyring-update" "gnu-elpa-keyring-update.el"
;;;;;;  (24245 53982 865284 257000))
;;; Generated autoloads from gnu-elpa-keyring-update.el

(defvar gnu-elpa-keyring-update--keyring (let ((kr (expand-file-name "etc/gnu-elpa.gpg-keyring" (file-name-directory load-file-name)))) (if (and load-file-name (file-readable-p kr)) kr "etc/gnu-elpa.gpg-keyring")))

(autoload 'gnu-elpa-keyring-update "gnu-elpa-keyring-update" "\
Import new GNU ELPA keys (if any) into package.el's keyring.

\(fn)" nil nil)
 (eval-after-load 'package
  `(and (bound-and-true-p package-user-dir)
        (file-directory-p package-user-dir)
        (let ((ts (expand-file-name
                   "gnu-elpa.timestamp"
                   (or (bound-and-true-p package-gnupghome-dir)
                       (expand-file-name "gnupg"
                                         package-user-dir))))
              (kr gnu-elpa-keyring-update--keyring))
          (and (file-writable-p ts)
               (file-readable-p kr)
               (file-newer-than-file-p kr ts)
               (gnu-elpa-keyring-update)))))

;;;***

;;;### (autoloads nil nil ("gnu-elpa-keyring-update-pkg.el") (24245
;;;;;;  53982 861284 310000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; gnu-elpa-keyring-update-autoloads.el ends here
