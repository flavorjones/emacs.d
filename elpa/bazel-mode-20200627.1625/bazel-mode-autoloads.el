;;; bazel-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "bazel-build" "bazel-build.el" (0 0 0 0))
;;; Generated autoloads from bazel-build.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "bazel-build" '("bazel-")))

;;;***

;;;### (autoloads nil "bazel-mode" "bazel-mode.el" (0 0 0 0))
;;; Generated autoloads from bazel-mode.el

(autoload 'bazel-build-mode "bazel-mode" "\
Major mode for editing Bazel BUILD files.

\(fn)" t nil)

(add-to-list 'auto-mode-alist (cons (rx 47 (or "BUILD" "BUILD.bazel") eos) #'bazel-build-mode))

(autoload 'bazel-workspace-mode "bazel-mode" "\
Major mode for editing Bazel WORKSPACE files.

\(fn)" t nil)

(add-to-list 'auto-mode-alist (cons (rx 47 (or "WORKSPACE" "WORKSPACE.bazel") eos) #'bazel-workspace-mode))

(autoload 'bazel-starlark-mode "bazel-mode" "\
Major mode for editing Bazel Starlark files.

\(fn)" t nil)

(add-to-list 'auto-mode-alist (cons (rx 47 (+ nonl) ".bzl" eos) #'bazel-starlark-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "bazel-mode" '("bazel-mode")))

;;;***

;;;### (autoloads nil "bazel-util" "bazel-util.el" (0 0 0 0))
;;; Generated autoloads from bazel-util.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "bazel-util" '("bazel-util-")))

;;;***

;;;### (autoloads nil "bazelrc-mode" "bazelrc-mode.el" (0 0 0 0))
;;; Generated autoloads from bazelrc-mode.el

(autoload 'bazelrc-mode "bazelrc-mode" "\
Major mode for editing .bazelrc files.

\(fn)" t nil)

(add-to-list 'auto-mode-alist (cons (rx 47 (or "bazel.bazelrc" ".bazelrc") eos) #'bazelrc-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "bazelrc-mode" '("bazelrc-ffap")))

;;;***

;;;### (autoloads nil nil ("bazel-mode-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; bazel-mode-autoloads.el ends here
