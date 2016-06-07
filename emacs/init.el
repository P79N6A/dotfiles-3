;;; init.el --- Hi Emacs!
;; Author: cosmtrek <cosmtrek@gmail.com>
;; Version: 0.1
;; Last updated: 2015-12-03

;;; Commentary:
;; This file just sets load path and some necessary environment variables.

;;; Thanks:
;; https://github.com/purcell/emacs.d
;; https://github.com/bbatsov/prelude

;;; Code:

;; Load path
(add-to-list 'load-path (expand-file-name "conf" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "plugins" user-emacs-directory))

(defun sanityinc/time-subtract-millis (b a)
  (* 1000.0 (float-time (time-subtract b a))))

(defconst *is-a-mac* (eq system-type 'darwin))

(eval-when-compile (require 'cl))

;;; Bootstrap
(require 'init-utils)
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path) ;; Set up $PATH
(require 'init-settings)  ;; Better defaults

;;; Local configs
(require-package 'diminish)
(require-package 'mwe-log-commands)

;; Set default theme
(require-package 'color-theme-sanityinc-solarized)
(setq-default custom-enabled-themes '(sanityinc-solarized-light))
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))
(add-hook 'after-init-hook 'reapply-themes)

(require 'init-frame-hooks)
(require 'init-gui-frames)

(require 'init-dired)
(require 'init-isearch)
(require 'init-grep)
(require 'init-uniquify)
(require 'init-ibuffer)
(require 'init-flycheck)

(require 'init-recentf)
(require 'init-ido)
(require 'init-company)
(require 'init-hippie-expand)
(require 'init-windows)
(require 'init-sessions)
(require 'init-fonts)
(require 'init-mmm)

(require 'init-editing-utils)
(require 'init-whitespace)
(require 'init-paredit)

(require 'init-vc)
(require 'init-git)
(require 'init-projectile)
(require 'init-dash)
(require 'init-ggtags)

(require 'init-compile)
(require 'init-ruby-mode)
(require 'init-c-mode)
(require 'init-go-mode)
(require 'init-javascript)
(require 'init-html)
(require 'init-nxml)
(require 'init-css)
(require 'init-lisp)
(require 'init-sql)
(require 'init-markdown)
(require 'init-csv)
(require 'init-python-mode)
;; (unless (version<= emacs-version "24.2")
;;   (require 'init-clojure)
;;   (require 'init-clojure-cider))

(require-package 'gnuplot)
(require-package 'htmlize)
(require-package 'regex-tool)
(require-package 'restclient)

;; Daemon mode
(require 'server)
(unless (server-running-p)
  (server-start))

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ace-isearch-function (quote avy-goto-char))
 '(ace-isearch-input-length 7)
 '(ace-isearch-jump-delay 0.25)
 '(ace-isearch-use-jump (quote printing-char))
 '(custom-enabled-themes (quote (sanityinc-solarized-light)))
 '(custom-safe-themes
   (quote
    ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-tooltip ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-common ((((type x)) (:inherit company-tooltip :weight bold)) (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 '(company-tooltip-selection ((t (:background "steelblue" :foreground "white")))))
