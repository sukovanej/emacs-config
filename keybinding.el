(general-evil-setup)

;; === GENERAL ===

;; M-x
(general-nmap :prefix "SPC" ":" 'execute-extended-command)

;; find-file
(general-nmap :prefix "SPC" "SPC" 'find-file)

(general-nmap "C-l" 'evil-window-right)
(general-nmap "C-h" 'evil-window-left)
(general-nmap "C-k" 'evil-window-top)
(general-nmap "C-j" 'evil-window-button)

;; === BUFFERS ===

;; show buffers
(general-nmap :prefix "SPC" "b b" 'ibuffer)

;; kill the current buffer
(general-nmap :prefix "SPC" "b d"
  (lambda ()
    (interactive)
    (kill-buffer (current-buffer))))

;; === MAGIT ===

;; magit status
(general-nmap :prefix "SPC" "g s" 'magit)

;; === CONFIG ====

;; show init.el
(general-nmap :prefix "SPC" "c e"
  (lambda ()
    (interactive)
    (find-file user-init-file)))
