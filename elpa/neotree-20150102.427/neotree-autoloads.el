;;; neotree-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (neotree-dir neotree-hide neotree-show neotree-toggle
;;;;;;  neotree-projectile-action neotree-find) "neotree" "neotree.el"
;;;;;;  (21680 11490 90759 251000))
;;; Generated autoloads from neotree.el

(autoload 'neotree-find "neotree" "\
Quick select node which specified PATH in NeoTree.
If path is nil and no buffer file name, then use DEFAULT-PATH,

\(fn &optional PATH DEFAULT-PATH)" t nil)

(autoload 'neotree-projectile-action "neotree" "\
Integration with `Projectile'.

Usage:
    (setq projectile-switch-project-action 'neotree-projectile-action).

When running `projectile-switch-project' (C-c p p), `neotree' will change root
automatically.

\(fn)" t nil)

(autoload 'neotree-toggle "neotree" "\
Toggle show the NeoTree window.

\(fn)" t nil)

(autoload 'neotree-show "neotree" "\
Show the NeoTree widnow.

\(fn)" t nil)

(autoload 'neotree-hide "neotree" "\
Close the NeoTree window.

\(fn)" t nil)

(autoload 'neotree-dir "neotree" "\
Show the NeoTree window, and change root to PATH.

\(fn PATH)" t nil)

(defalias 'neotree 'neotree-show "\
Show the NeoTree window.")

;;;***

;;;### (autoloads nil nil ("neotree-pkg.el") (21680 11490 140010
;;;;;;  598000))

;;;***

(provide 'neotree-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; neotree-autoloads.el ends here
