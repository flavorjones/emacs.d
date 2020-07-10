;;; udev-mode.el --- Major mode for editing udev rules files     -*- lexical-binding: t; -*-

;; Copyright (C) 2020 Benjamin Staffin

;; Author: Benjamin Staffin <benley@gmail.com>
;; Version: 0.1
;; Package-Version: 20200702.1536
;; Package-Commit: 5ca236980662141518603672ebdbdf863756da5a
;; URL: https://github.com/benley/emacs-udev-mode
;; Keywords: languages, unix
;; Package-Requires: ((emacs "24"))

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; This package provides a major mode for editing rules files for udev.

;;; Code:

(defconst udev-match-keywords
  '("ACTION"
    "DEVPATH"
    "KERNEL"
    "NAME"
    "SYMLINK"
    "SUBSYSTEM"
    "DRIVER"
    "KERNELS"
    "SUBSYSTEMS"
    "DRIVERS"
    "TAGS"
    "TAG"
    "TEST"
    ;; "PROGRAM"  ;; this is special - uses PROGRAM="" even though it's a matcher, not a setter
    "RESULT"))

(defconst udev-matchparam-keywords
  '("ATTR"
    "SYSCTL"
    "ATTRS"
    "ENV"
    "CONST"
    "TEST"))

(defconst udev-assign-keywords
  '("NAME"
    "SYMLINK"
    "OWNER"
    "GROUP"
    "MODE"
    "TAG"
    "LABEL"
    "GOTO"
    "OPTIONS"))

(defconst udev-assignparam-keywords
  '("SECLABEL"
    "ATTR"
    "SYSCTL"
    "ENV"
    "RUN"  ;; {(program|builtin)}
    "IMPORT"  ;; {(program|builtin|file|db|cmdline|parent)}
    ))

(defconst udev-font-lock-keywords
  `((,(concat (regexp-opt udev-match-keywords 'words)
              (regexp-opt '("==" "!=")))
     (1 font-lock-constant-face))

    (,(concat (regexp-opt udev-matchparam-keywords 'words)
              "{\\([_A-Za-z0-9]+\\)}"
              (regexp-opt '("==" "!=")))
     (1 font-lock-constant-face)
     (2 font-lock-variable-name-face))

    (,(concat (regexp-opt udev-assign-keywords 'words)
              (regexp-opt '("+=" "-=" ":=" "=")))
     (1 font-lock-builtin-face))

    (,(concat (regexp-opt udev-assignparam-keywords 'words)
              "{\\([_A-Za-z0-9]+\\)}"
              (regexp-opt '("+=" "-=" ":=" "=")))
     (1 font-lock-builtin-face)
     (2 font-lock-variable-name-face))

    ("\\(PROGRAM\\)=" . (1 font-lock-constant-face))))

;;;###autoload
(define-derived-mode udev-mode prog-mode "udev"
  (setq font-lock-defaults '(udev-font-lock-keywords
                             nil ;; keywords-only
                             nil ;; case-fold
                             nil ;; syntax-alist
                             nil ;; other-vars
                             ))
  (setq comment-start "#")
  (setq comment-end "")

  (modify-syntax-entry ?# "<" udev-mode-syntax-table)
  (modify-syntax-entry ?\n ">" udev-mode-syntax-table))

;;;###autoload
(add-to-list 'auto-mode-alist (cons "\\.rules\\'" 'udev-mode))

(provide 'udev-mode)

;;; udev-mode.el ends here
