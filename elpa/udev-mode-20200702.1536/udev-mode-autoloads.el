;;; udev-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "udev-mode" "udev-mode.el" (0 0 0 0))
;;; Generated autoloads from udev-mode.el

(autoload 'udev-mode "udev-mode" "\


\(fn)" t nil)

(add-to-list 'auto-mode-alist (cons "\\.rules\\'" 'udev-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "udev-mode" '("udev-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; udev-mode-autoloads.el ends here
