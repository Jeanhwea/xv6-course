((c-mode .
   ((eval . (eglot-ensure))
     (eval . (add-hook 'before-save-hook #'eglot-format-buffer nil t))))
  (c++-mode .
    ((eval . (eglot-ensure))
      (eval . (add-hook 'before-save-hook #'eglot-format-buffer nil t))))
  (nil . ((eval . (add-hook 'before-save-hook #'whitespace-cleanup)))))
