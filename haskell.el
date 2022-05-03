(use-package haskell-mode
  :ensure t
  :hook ((haskell-mode . tree-sitter-hl-mode)
	 (haskell-mode . lsp)))
