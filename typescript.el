(use-package tide
  :ensure t
  :after (company))

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tree-sitter-hl-mode)
         (before-save . tide-format-before-save)))

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))
