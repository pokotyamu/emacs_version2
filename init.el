(require 'package)

;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

;; MELPA-stableを追加
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

;; Marmaladeを追加
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; Orgを追加
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)


;; 初期化
(package-initialize)

(global-font-lock-mode t) ;;文字の色つけ
(display-time) ;;時計を表示
(show-paren-mode 1) ;; 対応する括弧を光らせる。
(global-hl-line-mode) ;; 編集行のハイライト
;; 行番号表示
(global-linum-mode t)
(set-face-attribute 'linum nil
		    :foreground "#800"
		    :height 0.5)



;; Window 分割・移動を C-t で
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (if (>= (window-body-width) 270)
	(split-window-horizontally-n 3)
      (split-window-horizontally)))
  (other-window 1))
(global-set-key (kbd "C-t") 'other-window-or-split)

;;rubyでのマジックコメント消す
(setq ruby-insert-encoding-magic-comment nil)

(when (eq system-type 'darwin)
  (setq ns-command-modifier (quote meta)))


(add-to-list 'load-path "~/.emacs.d/elisp/magit/lisp")
(require 'magit)
(require 'git-gutter)
;; If you enable global minor mode
(global-git-gutter-mode t)

;; If you would like to use git-gutter.el and linum-mode
(git-gutter:linum-setup)

;; If you enable git-gutter-mode for some modes
(add-hook 'ruby-mode-hook 'git-gutter-mode)

(global-set-key (kbd "C-x C-g") 'git-gutter:toggle)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)

;; Jump to next/previous hunk
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

;; Stage current hunk
(global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)

;; Revert current hunk
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)

;; Mark current hunk
(global-set-key (kbd "C-x v SPC") #'git-gutter:mark-hunk)


(require 'anything-config)
(add-to-list 'anything-sources 'anything-c-source-emacs-commands)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
