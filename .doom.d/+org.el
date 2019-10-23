;;;  -*- lexical-binding: t; -*-

(setq org-directory '("~/Dropbox (BBC)/Apps/orgzly/"))
(setq org-agenda-files org-directory)

;; open file types with extension
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))

(with-eval-after-load 'org
  (setq org-default-notes-file (concat (first org-directory) "refile.org"))

;;  (setq org-capture-templates
;;        '(("t" "Todo" entry (file+headline (concat (first org-directory) "refile.org") "Tasks")
;;           "* TODO %?\n  %i\n  %a")))

;;  (setq org-capture-templates
;;        '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
;;           "* TODO %?\n  %i\n  %a")
;;          ("j" "Journal" entry (file+datetree "~/org/journal.org")
;;           "* %?\nEntered on %U\n  %i\n  %a")))

  (setq org-use-fast-todo-selection t)

    ;; Set TODO keywords
    (setq org-todo-keywords '((sequence "TODO(t)" "IN-PROGRESS(i)" "|" "DONE(d)")
                              (sequence "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "MEETING")))
    (setq org-todo-keyword-faces
          '(("TODO" :foreground "red" :weight bold)
            ("IN-PROGRESS" :foreground "blue" :weight bold)
            ("DONE" :foreground "forest green" :weight bold)
            ("HOLD" :foreground "magenta" :weight bold)
            ("CANCELLED" :foreground "forest green" :weight bold)
            ("MEETING" :foreground "forest green" :weight bold)))

    (setq org-todo-state-tags-triggers
      '(("CANCELLED" ("CANCELLED" . t))
        ("HOLD" ("HOLD" . t))
        (done ("HOLD"))
        ("TODO" ("CANCELLED") ("HOLD"))
        ("IN-PROGRESS" ("CANCELLED") ("HOLD"))
        ("DONE" ("CANCELLED") ("HOLD"))))

    ;; (seq org-tags-alist )

    (use-package org-brain :ensure t
      :init
      (setq org-brain-path "~/Dropbox (BBC)/Apps/orgzly/brain")
      ;; For Evil users
      (with-eval-after-load 'evil
        (evil-set-initial-state 'org-brain-visualize-mode 'emacs))
      :config
      (setq org-id-track-globally t)
      (setq org-id-locations-file "~/.emacs.d/.org-id-locations")
      (push '("b" "Brain" plain (function org-brain-goto-end)
              "* %i%?" :empty-lines 1)
            org-capture-templates)
      (setq org-brain-visualize-default-choices 'all)
      (setq org-brain-title-max-length 12)))
