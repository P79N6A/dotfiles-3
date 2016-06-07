;;; go mode
(require-package 'go-mode)
(require-package 'company-go)

(setenv "GOPATH" "/Users/cosmtrek/Code/go")
(setenv "GOROOT" "/usr/local/go")
(load "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")
(setq gofmt-command "goimports")

(add-hook 'go-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
            (local-set-key (kbd "C-c C-g") 'go-goto-imports)
            (local-set-key (kbd "C-c C-f") 'gofmt)
            (local-set-key (kbd "C-c C-k") 'godoc)
            (local-set-key (kbd "M-.") 'godef-jump)
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 4)
            (setq indent-tabs-mode 1)))

(eval-after-load 'company
  '(push 'company-go company-backends))

(provide 'init-go-mode)
