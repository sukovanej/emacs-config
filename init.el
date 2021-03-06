;; Disable GUI
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq use-dialog-box t)
(setq use-file-dialog nil)
(setq-default frame-title-format '("%b  -  GNU Emacs"))

;; Highlight current line
(global-hl-line-mode +1)

;; Font
(set-frame-font
 "-JB-JetBrains Mono-normal-normal-normal-*-18-*-*-*-m-0-iso10646-1"
 nil t)

;; Line numbers
(setq linum-relative-current-symbol "")

;; Hide the startup screen
(setq inhibit-startup-screen t)

;; Increase font size
(set-face-attribute 'default nil :height 130)

;; Set prefered coding
(prefer-coding-system 'utf-8)

;; Set customizations file
(setq custom-file (concat user-emacs-directory "customizations.el"))

;; Disable ring
(setq ring-bell-function 'ignore)

;; Optimization
(setq load-prefer-newer t)
(setq read-process-output-max (* 1024 1024))

;; track recently opened files
(recentf-mode 1)

;; track minibuffer history
(savehist-mode 1)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(with-eval-after-load 'package
  (add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
  (add-to-list 'package-archives '("melpa"  . "https://melpa.org/packages/")))

(require 'use-package)

(use-package delight
  :ensure t)

(use-package which-key
  :ensure t
  :init
  (setq which-key-idle-delay 3)
  :config
  (which-key-mode))

(use-package ibuffer
  :init
  (add-hook 'ibuffer-mode-hook #'hl-line-mode))

(use-package magit
  :ensure t)

(use-package prog-mode
  :hook ((prog-mode . show-paren-mode)))

(use-package company
  :ensure t
  :delight
  :config
  (global-company-mode 1)
  :custom
  (company-idle-delay 0)
  (company-minimum-prefex-length 1))

(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package general
  :ensure t)

(use-package tree-sitter
  :ensure t
  :config
  (global-tree-sitter-mode))

(use-package tree-sitter-langs
  :ensure t
  :after tree-sitter)

(use-package dracula-theme
  :ensure t
  :config
  (load-theme 'dracula t))

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package telephone-line
  :ensure t
  :config
  (telephone-line-mode 1))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(use-package linum-relative
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'linum-relative-mode))

(use-package lsp-mode :ensure t)

(use-package counsel
  :ensure t
  :config
  (ivy-mode 1))

(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")

(load-file "~/.emacs.d/typescript.el")
(load-file "~/.emacs.d/haskell.el")
(load-file "~/.emacs.d/keybinding.el")
