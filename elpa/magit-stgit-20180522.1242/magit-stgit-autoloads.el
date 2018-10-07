;;; magit-stgit-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "magit-stgit" "magit-stgit.el" (23482 1041
;;;;;;  684205 471000))
;;; Generated autoloads from magit-stgit.el

(autoload 'magit-stgit-init "magit-stgit" "\
Initialize StGit support for the current branch.

\(fn)" t nil)

(autoload 'magit-stgit-new "magit-stgit" "\
Create a new StGit patch.
Use ARGS to pass additional arguments.

\(fn &rest ARGS)" t nil)

(autoload 'magit-stgit-edit "magit-stgit" "\
Edit the description of an existing StGit PATCH.
Use ARGS to pass additional arguments.

\(fn PATCH &rest ARGS)" t nil)

(autoload 'magit-stgit-float "magit-stgit" "\
Float StGit PATCHES to the top.
Use ARGS to pass additional arguments.

\(fn PATCHES &rest ARGS)" t nil)

(autoload 'magit-stgit-rename "magit-stgit" "\
Rename StGit patch OLDNAME to NEWNAME.

\(fn OLDNAME NEWNAME)" t nil)

(autoload 'magit-stgit-sink "magit-stgit" "\
Sink StGit PATCHES deeper down the stack.
Use ARGS to pass additional arguments.

\(fn PATCHES &rest ARGS)" t nil)

(autoload 'magit-stgit-commit "magit-stgit" "\
Permanently store patches into the stack base.

\(fn PATCHES &rest ARGS)" t nil)

(autoload 'magit-stgit-uncommit "magit-stgit" "\
Turn regular commits into StGit patches.

\(fn &rest ARGS)" t nil)

(autoload 'magit-stgit-refresh "magit-stgit" "\
Refresh StGit patch PATCH.
Use ARGS to pass additional arguments.

\(fn &optional PATCH &rest ARGS)" t nil)

(autoload 'magit-stgit-repair "magit-stgit" "\
Repair StGit metadata if branch was modified with git commands.
In the case of Git commits these will be imported as new patches
into the series.

\(fn)" t nil)

(autoload 'magit-stgit-rebase "magit-stgit" "\
Rebase a StGit patch series.
Use ARGS to pass additional arguments

\(fn &rest ARGS)" t nil)

(autoload 'magit-stgit-delete "magit-stgit" "\
Delete StGit patches.
Argument PATCHES is a list of patchnames.
Use ARGS to pass additional arguments.

\(fn PATCHES &rest ARGS)" t nil)

(autoload 'magit-stgit-goto "magit-stgit" "\
Set PATCH as target of StGit push and pop operations.
Use ARGS to pass additional arguments.

\(fn PATCH &rest ARGS)" t nil)

(autoload 'magit-stgit-show "magit-stgit" "\
Show diff of a StGit patch.

\(fn PATCH)" t nil)

(autoload 'magit-stgit-undo "magit-stgit" "\
Undo the last operation.
Use ARGS to pass additional arguments.

\(fn &rest ARGS)" t nil)

(autoload 'magit-stgit-redo "magit-stgit" "\
Undo the last undo operation.
Use ARGS to pass additional arguments.

\(fn &rest ARGS)" t nil)

(autoload 'magit-stgit-mail "magit-stgit" "\
Send PATCHES with \"stg mail\".

If a cover is specified, it will be searched to automatically set
the To, Cc, and Bcc fields for all patches.

\(fn PATCHES &rest ARGS)" t nil)

(autoload 'magit-stgit-mode "magit-stgit" "\
StGit support for Magit.

\(fn &optional ARG)" t nil)

(custom-add-option 'magit-mode-hook #'magit-stgit-mode)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; magit-stgit-autoloads.el ends here
