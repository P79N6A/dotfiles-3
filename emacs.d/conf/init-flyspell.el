(when (maybe-require-package 'flyspell)
  (setq ispell-program-name "aspell" ; use aspell instead of ispell
        ispell-extra-args '("--sug-mode=ultra"))
  (add-hook 'text-mode-hook #'flyspell-mode)
  (add-hook 'prog-mode #'flyspell-prog-mode))

(provide 'init-flyspell)
