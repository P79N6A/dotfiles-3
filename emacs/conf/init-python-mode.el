;;; elpy
(require-package 'elpy)

(elpy-enable)

(add-hook 'python-mode-hook
            (lambda ()
                    (setq-default indent-tabs-mode t)
                    (setq-default tab-width 4)
                    (setq-default py-indent-tabs-mode t)))

(provide 'init-python-mode)
