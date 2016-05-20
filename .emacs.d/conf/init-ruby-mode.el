;;; Basic ruby setup
(require-package 'ruby-mode)
(require-package 'ruby-hash-syntax)

(add-auto-mode 'ruby-mode
               "Rakefile\\'" "\\.rake\\'" "\\.rxml\\'"
               "\\.rjs\\'" "\\.irbrc\\'" "\\.pryrc\\'" "\\.builder\\'" "\\.ru\\'"
               "\\.gemspec\\'" "Gemfile\\'" "Kirkfile\\'")

(setq ruby-use-encoding-map nil)

(after-load 'ruby-mode
  (define-key ruby-mode-map (kbd "TAB") 'indent-for-tab-command)

  ;; Stupidly the non-bundled ruby-mode isn't a derived mode of
  ;; prog-mode: we run the latter's hooks anyway in that case.
  (add-hook 'ruby-mode-hook
            (lambda ()
              (unless (derived-mode-p 'prog-mode)
                (run-hooks 'prog-mode-hook)))))

;; -- GODAMMIT RUBY INDENTATION!!! --
;; don't indent parenthesis in a weird way
(setq ruby-align-chained-calls nil
      ruby-align-to-stmt-keywords '(if begin case)
      ruby-deep-indent-paren nil
      ruby-deep-indent-paren-style nil
      ruby-use-smie t)

(add-hook 'ruby-mode-hook 'subword-mode)

(after-load 'page-break-lines
  (push 'ruby-mode page-break-lines-modes))

;; Customise highlight-symbol to not highlight do/end/class/def etc.
(defun sanityinc/suppress-ruby-mode-keyword-highlights ()
  "Suppress highlight-symbol for do/end etc."
  (set (make-local-variable 'highlight-symbol-ignore-list)
       (list (concat "\\_<" (regexp-opt '("do" "end")) "\\_>"))))
(add-hook 'ruby-mode-hook 'sanityinc/suppress-ruby-mode-keyword-highlights)

;;; YAML
(require-package 'yaml-mode)

;;; Slim
(require-package 'slim-mode)

;;; ERB
(require-package 'mmm-mode)
(defun sanityinc/ensure-mmm-erb-loaded ()
  (require 'mmm-erb))

(require 'derived)

(defun sanityinc/set-up-mode-for-erb (mode)
  (add-hook (derived-mode-hook-name mode) 'sanityinc/ensure-mmm-erb-loaded)
  (mmm-add-mode-ext-class mode "\\.erb\\'" 'erb))

(let ((html-erb-modes '(html-mode html-erb-mode nxml-mode)))
  (dolist (mode html-erb-modes)
    (sanityinc/set-up-mode-for-erb mode)
    (mmm-add-mode-ext-class mode "\\.r?html\\(\\.erb\\)?\\'" 'html-js)
    (mmm-add-mode-ext-class mode "\\.r?html\\(\\.erb\\)?\\'" 'html-css)))

(mapc 'sanityinc/set-up-mode-for-erb
      '(coffee-mode js-mode js2-mode js3-mode markdown-mode textile-mode))

(mmm-add-mode-ext-class 'html-erb-mode "\\.jst\\.ejs\\'" 'ejs)

(add-auto-mode 'html-erb-mode "\\.rhtml\\'" "\\.html\\.erb\\'")
(add-to-list 'auto-mode-alist '("\\.jst\\.ejs\\'"  . html-erb-mode))
(mmm-add-mode-ext-class 'yaml-mode "\\.yaml\\'" 'erb)

(dolist (mode (list 'js-mode 'js2-mode 'js3-mode))
  (mmm-add-mode-ext-class mode "\\.js\\.erb\\'" 'erb))

(provide 'init-ruby-mode)
