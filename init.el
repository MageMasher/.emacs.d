(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(clojure-mode clojure-test-mode
                      notify gist twittering-mode browse-kill-ring
                      markdown-mode yaml-mode maxframe
                      jtags jtags-extras auto-complete
                      erc-hl-nicks find-things-fast fold-dwim-org
                      rainbow-delimiters org starter-kit starter-kit-lisp yasnippet))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; keep customize settings in their own file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;;; auto-complete
(require 'auto-complete-config)
(ac-config-default)

;;; markdown-mode
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
;;; yaml-mode
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; load private data - this doesn't go into git
(load (concat user-emacs-directory "private.el.gpg"))

;;; load my config
(let ((dir (concat user-emacs-directory "config")))
  (mapc 'load (directory-files dir t "^[^#].*el$")))

;;; something seems to append things here

;(setq auth-source-debug t)
(put 'narrow-to-region 'disabled nil)

