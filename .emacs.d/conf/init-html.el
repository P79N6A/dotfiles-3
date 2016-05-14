(require-package 'web-mode)

(defun web-mode-hook-settings ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-enable-css-colorization t
        ))
(add-hook 'web-mode-hook  'web-mode-hook-settings)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(require-package 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

;; (require-package 'tidy)
;; (add-hook 'html-mode-hook (lambda () (tidy-build-menu html-mode-map)))
;;
;; (require-package 'tagedit)
;; (after-load 'sgml-mode
;;   (tagedit-add-paredit-like-keybindings)
;;   (add-hook 'sgml-mode-hook (lambda () (tagedit-mode 1))))
;;
;; (add-auto-mode 'html-mode "\\.\\(jsp\\|tmpl\\)\\'")

(provide 'init-html)
