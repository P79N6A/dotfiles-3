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
(setq load-path (cons "~/Code/dotfiles/emacs.d" load-path)) 
(add-to-list 'load-path (expand-file-name "conf" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "plugins" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time
(setq load-prefer-newer t)

(defconst *is-a-mac* (eq system-type 'darwin))

;; Temporarily reduce gc during startup
(defconst sanityinc/initial-gc-cons-threshold gc-cons-threshold
	"Initial value of `gc-cons-threshold' at start-up time.")
(setq gc-cons-threshold (* 256 1024 1024))
(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold sanityinc/initial-gc-cons-threshold)))

;;; Debug
(setq debug-on-error 1)

;;; Bootstrap
(require 'init-utils)
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path) ;; Set up $PATH
(require 'init-settings)  ;; Better defaults

;;; Local configs
(require-package 'wgrep)
(require-package 'diminish)
(require-package 'scratch)
(require-package 'mwe-log-commands)

(require 'init-frame-hooks)
(require 'init-xterm)
(require 'init-themes)
(require 'init-gui-frames)
(require 'init-dired)
(require 'init-isearch)
(require 'init-grep)
(require 'init-uniquify)
(require 'init-ibuffer)
(require 'init-flycheck)
(require 'init-flyspell)

(require 'init-recentf)
(require 'init-ido)
(require 'init-hippie-expand)
(require 'init-auto-complete)
(require 'init-windows)
(require 'init-sessions)
(require 'init-fonts)
(require 'init-mmm)

(require 'init-editing-utils)
(require 'init-whitespace)
(require 'init-fci)

(require 'init-projectile)
(require 'init-vc)
(require 'init-git)

(require 'init-compile)
(require 'init-markdown)
;; (require 'init-csv)
(require 'init-javascript)
(require 'init-nxml)
(require 'init-html)
(require 'init-css)
;; (require 'init-python-mode)
(require 'init-go-mode)
(require 'init-ruby-mode)
;; (require 'init-rails)
(require 'init-sql)
(require 'init-paredit)
(require 'init-lisp)
;; (require 'init-crontab)
;; (require 'init-org)
;; (unless (version<= emacs-version "24.2")
;;   (require 'init-clojure)
;;   (require 'init-clojure-cider))

(require 'init-dash)
(require 'init-ggtags)

;; (require-package 'gnuplot)
;; (require-package 'htmlize)
;; (when *is-a-mac*
;;   (require-package 'osx-location))
;; (require-package 'regex-tool)

;; Show startup time
;; (add-hook 'after-init-hook
;; 	  (lambda ()
;; 	    (message "init completed in %.2fms"
;; 		     (sanityinc/time-subtract-millis after-init-time before-init-time))))

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
 '(custom-safe-themes
   (quote
    ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
