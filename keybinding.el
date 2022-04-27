(general-evil-setup)

;; === GENERAL ===

;; M-x
(general-nmap :prefix "SPC" ":" 'execute-extended-command)

;; === BUFFERS ===

;; show buffers
(general-nmap :prefix "SPC" "b b" 'ibuffer)

;; kill the current buffer
(general-nmap :prefix "SPC" "b d"
  (lambda ()
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
