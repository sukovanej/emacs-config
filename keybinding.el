(general-evil-setup)

;; ivy
(general-nmap "/" 'swiper-isearch)
(general-nmap "?" 'swiper-isearch-backward)

;; M-x
(general-nmap :prefix "SPC" ":" 'execute-extended-command)

;; find-file
(general-nmap :prefix "SPC" "C-f" 'counsel-find-file)
(general-nmap :prefix "SPC" "SPC" 'counsel-fzf)
(general-nmap :prefix "SPC" "a" 'counsel-ag)

(general-nmap "C-l" 'evil-window-right)
(general-nmap "C-h" 'evil-window-left)
(general-nmap "C-k" 'evil-window-top)
(general-nmap "C-j" 'evil-window-button)

;; show buffers
(general-nmap :prefix "SPC" "b b" 'ivy-switch-buffer)

;; eval buffer
(general-nmap :prefix "SPC" "b e" 'eval-buffer)

(defun kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

;; kill the current buffer
(general-nmap :prefix "SPC" "b d" 'kill-current-buffer)

;; magit status
(general-nmap :prefix "SPC" "g s" 'magit)

;; show init.el
(general-nmap :prefix "SPC" "c e"
  (lambda ()
    (interactive)
    (find-file user-init-file)))
