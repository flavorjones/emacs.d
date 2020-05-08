;;; solarized-theme-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "solarized" "solarized.el" (24245 54314 180828
;;;;;;  101000))
;;; Generated autoloads from solarized.el

(autoload 'solarized-color-blend "solarized" "\
Blends COLOR1 onto COLOR2 with ALPHA.

COLOR1 and COLOR2 should be color names (e.g. \"white\") or RGB
triplet strings (e.g. \"#ff12ec\").

Alpha should be a float between 0 and 1.

Optional argument DIGITS-PER-COMPONENT can be either 4 (the default) or 2;
use the latter if you need a 24-bit specification of a color.

\(fn COLOR1 COLOR2 ALPHA &optional DIGITS-PER-COMPONENT)" nil nil)

(autoload 'solarized-create-color-palette "solarized" "\
Create color-palette from CORE-PALETTE.

The Returned color-palette has the same format as `solarized-color-palette'

\(fn CORE-PALETTE)" nil nil)

(when (and (boundp 'custom-theme-load-path) load-file-name) (add-to-list 'custom-theme-load-path (file-name-as-directory (file-name-directory load-file-name))))

;;;***

;;;### (autoloads nil nil ("solarized-dark-high-contrast-theme.el"
;;;;;;  "solarized-dark-theme.el" "solarized-faces.el" "solarized-gruvbox-dark-theme.el"
;;;;;;  "solarized-gruvbox-light-theme.el" "solarized-light-high-contrast-theme.el"
;;;;;;  "solarized-light-theme.el" "solarized-palettes.el" "solarized-theme-pkg.el"
;;;;;;  "solarized-theme-utils.el" "solarized-theme.el" "solarized-wombat-dark-theme.el"
;;;;;;  "solarized-zenburn-theme.el") (24245 54314 184828 47000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; solarized-theme-autoloads.el ends here
