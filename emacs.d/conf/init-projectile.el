(require-package 'projectile)

(projectile-global-mode)
(eval-after-load "Projectile"
  '(diminish 'projectile-mode "Proj"))

(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)

(setq projectile-enable-caching t)
(setq projectile-file-exists-remote-cache-expire nil)

(provide 'init-projectile)
