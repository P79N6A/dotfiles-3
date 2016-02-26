;;; jedi
(require-package 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook
          (lambda ()
            (setq indent-tabs-mode t)
            (setq tab-width 4)
            (setq python-indent 4)))

(provide 'init-python-mode)
