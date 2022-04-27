;; Disable GUI
(tool-bar-mode -1)
(setq use-dialog-box t)
(setq use-file-dialog nil)
(setq-default frame-title-format '("%b  -  GNU Emacs"))

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

(with-eval-after-load 'package
  (add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
  (add-to-list 'package-archives '("melpa"  . "https://melpa.org/packages/")))

;; Use package
;; (unless (package-installed-p 'use-package)
;;  (package-refresh-contents)
;;  (package-install 'use-package))

(require 'use-package)

(use-package delight :ensure t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(use-package which-key
  :ensure t
  :init
  (setq which-key-idle-delay 3)
  :config
  (which-key-mode))

(use-package ibuffer
  :init
  (add-hook 'ibuffer-mode-hook #'hl-line-mode))

;; track recently opened files
(recentf-mode 1)

;; track minibuffer history
(savehist-mode 1)

(use-package vertico
  :ensure t
  :init (vertico-mode))

(use-package magit
  :ensure t)

(use-package prog-mode :hook ((prog-mode . show-paren-mode)))

(use-package company
  :ensure t
  :delight
  :config
  (global-company-mode 1)
  :custom
  (company-idle-delay 0)
  (company-minimum-prefex-length 1))

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))

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

(load-file "~/.emacs.d/keybinding.el")
