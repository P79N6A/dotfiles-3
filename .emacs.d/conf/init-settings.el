;;; Better defaults
;; UTF-8 encoding
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; GC Optimization
(setq gc-cons-threshold 50000000)

;; Http proxy
(defun cosmtrek/proxy (port)
  "Set http proxy url."
  (interactive
   (list
    (read-string "Input port or use default 10240?")))
  (if (equal port "")
      (setq port "10240"))
  (message (format "http://127.0.0.1:%s" port))
  (setenv "http_proxy" (format "http://127.0.0.1:%s" port)))

(defun cosmtrek/direct ()
  "Cancel http proxy."
  (interactive)
  (setenv "http_proxy" nil))

(setq tramp-default-method "ssh")

;; The toolbar, menu bar, and scroll bar are all turned off.
(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  (mouse-wheel-mode 1)
  (blink-cursor-mode -1))

;; Nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

(when (functionp 'set-fringe-style)
  (set-fringe-style '(4 . 0)))

;; Use a more interesting startup message.
(defun startup-echo-area-message ()
  "To boldly do what you fear.")

;; Enable basic syntax highlighting.
(global-font-lock-mode 1)

;; Miscellaneous settings
(setq-default inhibit-splash-screen t                 ; Skip startup message and splash screen.
              inhabit-startup-message t
              confirm-kill-emacs 'y-or-n-p            ; Disallow accidental exits.
              comment-empty-lines t                   ; Prefix empty lines too.
              initial-major-mode 'text-mode           ; Text mode, not Elisp.
              make-backup-files nil                   ; No "backup~" files or "#autosave#" files.
              auto-save-default nil
							auto-revert-mode t                      ; Revert file automatically.
              size-indication-mode t                  ; Display the size of the buffer.
              column-number-mode t                    ; Display the current column number
              require-final-newline t                 ; Ensure a newline at the end if there isn't already one there.
              indent-tabs-mode t                      ; Always indent using spaces, never tabs.
              default-tab-width 8                     ; Set tab width to 2.
              standard-indent  2                      ; Set standard indent to 2 rather that 4.
              delete-selection-mode t                 ; Replace the active region just by typing text.
              save-interprogram-paste-before-kill t   ; Delete text without kill ring.
              apropos-do-all t
              large-file-warning-threshold (* 20 1024 1024) ; Don't warn me about large files unless they're at least 25MB.
              indicate-buffer-boundaries nil
              read-file-name-completion-ignore-case t ; Ignore case when using completion for file names.
              line-move-visual t                      ; Move around lines based on how they are displayed.
							make-pointer-invisible t                ; Hide the mouse while typing.
              find-file-visit-truename nil            ; It's okay to refer to a file by a symlink.
              kill-whole-line t                       ; Kill whole line and newline with C-k if at beginning of line.
              set-mark-command-repeat-pop t           ; Cycle through the mark ring.
							tags-revert-without-query t             ; Reload TAGS automatically.
							apropos-sort-by-scores t)               ; Sort results by relevancy.

;; Disable prompts. http://www.masteringemacs.org/article/disabling-prompts-emacs
(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
         kill-buffer-query-functions))

;; In every buffer, the line which contains the cursor will be fully
;; highlighted
(global-hl-line-mode 1)

;; Visual line
(global-visual-line-mode 1)

;; Highlight the matching pair when the point is over parentheses.
(show-paren-mode 1)

;; Set fill column.
(auto-fill-mode 1)
(setq fill-column 120)

;; The `saveplace` library saves the location of the point when you kill a buffer and returns to it next time you visit the associated file.
(setq-default save-place t)

(provide 'init-settings)
