;; Stop C-z from minimizing windows under OS X
(defun sanityinc/maybe-suspend-frame ()
  (interactive)
  (unless (and *is-a-mac* window-system)
    (suspend-frame)))

(global-set-key (kbd "C-z") 'sanityinc/maybe-suspend-frame)

;; Suppress GUI features
(setq use-file-dialog nil)
(setq use-dialog-box nil)

;; Show a marker in the left fringe for lines not in the buffer
(setq indicate-empty-lines t)

;; Window size and features
(let ((no-border '(internal-border-width . 0)))
  (add-to-list 'default-frame-alist no-border)
  (add-to-list 'initial-frame-alist no-border))

(add-hook 'after-make-frame-functions
          (lambda (frame)
            (with-selected-frame frame
              (unless window-system
                (set-frame-parameter nil 'menu-bar-lines 0)))))

(setq frame-title-format
      (list '(:eval (projectile-project-name))
            " λ "
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(provide 'init-gui-frames)
