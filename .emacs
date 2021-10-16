(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(inhibit-startup-screen t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun cpp-mode-hook ()
    (setq c-default-style "Linux")
    ;;custom settings for c++
    (c-set-offset 'substatement-open 0) ;;removes unncessary indent after declaring function/ifstmt
    (setq c-basic-offset 4)
    (setq c-indent-level 4)
    (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
    (setq tab-width 4)
)

(add-hook 'c++-mode-hook 'cpp-mode-hook)

(setq backup-directory-alist '(("." . "~/.emacs-saves")))
(show-paren-mode 1)
(global-linum-mode t)

;;function to force emacs to default open two files side by side
(defun 2-windows-vertical-to-horizontal ()
  (let ((buffers (mapcar 'window-buffer (window-list))))
    (when (= 2 (length buffers))
      (delete-other-windows)
      (set-window-buffer (split-window-horizontally) (cadr buffers)))))

;;add hook for startup
(add-hook 'emacs-startup-hook '2-windows-vertical-to-horizontal)
