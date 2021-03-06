;;; nix-format.el --- Nix formatter -*- lexical-binding: t -*-

;; This file is NOT part of GNU Emacs.

;; Version: 1.4.0

;;; Commentary:

;;; Code:

(defcustom nix-nixfmt-bin "nixfmt"
  "Path to nixfmt executable."
  :group 'nix
  :type 'string)

(defun nix--format-call (buf nixfmt-bin)
  "Format BUF using nixfmt."
  (with-current-buffer (get-buffer-create "*nixfmt*")
    (erase-buffer)
    (insert-buffer-substring buf)
    (if (zerop (call-process-region (point-min) (point-max) nixfmt-bin t t nil))
        (progn
          (if (not (string= (buffer-string) (with-current-buffer buf (buffer-string))))
              (copy-to-buffer buf (point-min) (point-max)))
          (kill-buffer))
      (error "Nixfmt failed, see *nixfmt* buffer for details"))))

(defun nix--find-nixfmt ()
  "Find the nixfmt binary, or error if it's missing."
  (let ((nixfmt-bin (executable-find nix-nixfmt-bin)))
    (unless nixfmt-bin
      (error "Could not locate executable \"%s\"" nix-nixfmt-bin))
    nixfmt-bin))

(defun nix-format-buffer ()
  "Format the current buffer using nixfmt."
  (interactive)
  (nix--format-call (current-buffer) (nix--find-nixfmt))
  (message "Formatted buffer with nixfmt."))

(provide 'nix-format)
;;; nix-format.el ends here
