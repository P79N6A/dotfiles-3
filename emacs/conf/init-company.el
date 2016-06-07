(require-package 'company)
(require 'company)

(setq company-idle-delay 0.5)
(setq company-minimum-prefix-length 3)
(setq company-show-numbers t)
(setq company-tooltip-limit 10)

(setq company-dabbrev-downcase nil)
(setq company-dabbrev-ignore-case t)

(setq company-dabbrev-code-ignore-case t)
(setq company-dabbrev-code-everywhere t)

(setq company-etags-ignore-case t)

(global-company-mode)

(provide 'init-company)
