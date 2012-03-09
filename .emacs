;;;; 
; John E. Griffin
; April 1997



;;;; Notes and Hints

;;; edit-options
; use edit-options command to view variables that can be set
; these variables are only set for the duration of the session

;;; bindings
; C-c bindings are reserved for personal use 
; packages should not use these

;;; keymaps
; Keymaps can be overridded for specific modes e.g
; (define-key texinfo-mode-map "\C-c\C-cg"
;      'texinfo-insert-@group)

;;; load files/path
; you can load files .el or .elc with the load command e.g
;   (load "~/emacs/kfill")
; the load-path variable hold the current load path
; you can add to the load path e.g
(setq load-path (cons "~/emacs" load-path))
;(setq load-path (cons "~//DOWNLOADS/org-6.22b/lisp" load-path))
(setq load-path (cons "/usr/local/src/lisp" load-path))
; use load-file or load-library to interactively load libs

;;; evaluating lisp expressions
; place the cursor afer the expression the C-x C-e or
; move to the *scratch* buffer, enter the expression
; and do C-x C-e or C-u C-x C-e to make it appear in the 
; buffer

;;; load path
; evaluate the variable load-path in scratch buffer

;;; keys pressed
; to see what keys are pressed use the command (view-lossage)
; bound to C-h l

;;; incremental search
; isearch-forward-regexp	      M-C-s
; isearch-forward		      C-s
; isearch-backward-regexp	      M-C-r
; isearch-backward	              C-r

;;; bookmarks
; all are accessible through Search - Bookmarks menubar
; bookmark-bmenu-list
; bookmark-menu-jump
; etc

;;; hooks
; hooks are setup to run some lisp when a mode is invoked
; for example:
; (add-hook 'c-mode-common-hook '(lambda () (c-toggle-auto-hungry-state 1)))
; will run the command c-toggle-auto-hungry-state when c-mode is loaded

;;; emacs as a server
; allows you to run emacs as a server so that a new instance of emacs
; is not started when an editor is invoked using $EDITOR variable
; 1. within emacs call server-start -- add (server-start) to .emacs
; 2. add export EDITOR=emacsclient in .bashrc
; 3. invoke in other tool e.g file manager
; 4. C-x # when finished editing buffer to return from buffer

;;; c-mode
; for a description of c-mode look into c-mode.el itself

;;;; Server mode
(server-start)

;;;; User defined macros
; (load-file "~/emacs/macro.perl")

;;;; Variable Customisation

;;; Text mode and Auto Fill mode
; The next two lines put Emacs into Text mode
; and Auto Fill mode, and are for writers who
; want to start writing prose rather than code.
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; set email address
; (setq user-mail-address 'jgriffin@netratings.com)

;;; ChangeLog
(setq add-log-mailing-address "john.e.griffin@nielsen.com")

;;; yank at cursor
(setq mouse-yank-at-point t)

;;; Emacs Load Path
(setq load-path (cons "~/emacs" load-path))

;;; Highlighting for search strings
(setq search-highlight t)

;; Enable font-lock for all buffers
(global-font-lock-mode t)

;; Save some screen real-estate
(tool-bar-mode -1)
(menu-bar-mode -1)

;;; Font-lock mode
; use lazy lock support mode
;(setq font-lock-support-mode 'lazy-lock-mode)
; use maximum decoration
;(setq font-lock-maximum-decoration t)

;;; C-mode hooks
(add-hook 'c-mode-common-hook '(lambda () (c-toggle-auto-hungry-state 1)))
(add-hook 'c-mode-common-hook '(lambda () (c-set-style "bsd")))

;;; C++-mode hooks
(add-hook 'c++-mode-hook '(lambda () (c-set-style "ellemtel")))

;
; (setq c++-mode-hook
;    (function (lambda ()
;                (setq indent-tabs-mode nil)
;                (setq c-indent-level 4))))
;



;;; extension mode list
(setq auto-mode-alist
      (append '(("\\.C$"  . c++-mode)
				("\\.cc$" . c++-mode)
				("\\.hh$" . c++-mode)
				("\\.ec$" . c-mode)
				("\\.c$"  . c-mode)
				("\\.h$"  . c++-mode)
				("\\.tmp$" . cperl-mode)
				("\\.tmpl$" . html-mode))
	      auto-mode-alist))


;;; auto line numbering
(setq line-number-mode t)


;;;; org mode
(require 'org-publish)
(require 'org-exp)
(require 'org-latex)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(setq org-log-done 'time)
(setq org-hide-leading-stars 1)
(setq org-tag-alist '(("PERSONAL" . ?p) ("OPS" . ?o) ("DEVEL" . ?d) ("ADMIN" . ?a) ("ESTIMATES" . ?e) ("BUGS" . ?b)))

;; JavaScript setup
(add-to-list 'auto-mode-alist '("\\.js\\'" . espresso-mode))
(autoload 'espresso-mode "espresso" nil t)

(autoload 'moz-minor-mode "moz" "Mozilla Minor and Inferior Mozilla Modes" t)

(add-hook 'espresso-mode-hook 'espresso-custom-setup)
(defun espresso-custom-setup ()
  (moz-minor-mode 1))


;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Groovy editing mode." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))


; (org-remember-insinuate)
;     (setq org-directory "~/org/")
;     (setq org-default-notes-file (concat org-directory "/notes.org"))
;     (define-key global-map "\C-cr" 'org-remember)

; (setq org-remember-templates
;      '(("Todo" ?t "* TODO %?\n  %i\n  %a" "~/org/todo.org" "top")
;        ("Journal" ?j "* %U %?\n\n  %i\n  %a" "~/org/journal.org" "top")))

(global-font-lock-mode 1)

;;;; Keybindings

;;; Keybinding for `compile'
;
; C-c is used by ebrowse, so do not use for compile
; (global-set-key "\C-cc" 'compile)

;;; Keybinding for `shell'
(global-set-key "\C-cx" 'shell)

;;; Keybinding for `occur'
; shows all lines in buffer that match regex
(global-set-key "\C-co" 'occur)

;;; Keybinding for `goto-line'
(global-set-key "\C-cl" 'goto-line)

;;; Keybinding for `ispell'
(global-set-key "\C-ci" 'ispell)

;;; Keybinding for `perl-sub'
(global-set-key "\C-cp" 'perl-sub)

;;; Unbind `C-x f'
(global-unset-key "\C-xf")

;;; Rebind `C-x C-b' for `buffer-menu'
(global-set-key "\C-x\C-b" 'buffer-menu)


;;;; User Lisp Extensions

;;; Line to top of window;
;;; replace three keystroke sequence  C-u 0 C-l
(defun line-to-top-of-window ()
  "Move the line point is on to top of window."
  (interactive)
  (recenter 0))


;;; Line numbers for a region
(defun number-lines-region (start end &optional beg)
      (interactive "*r\np")
      (let* ((lines (count-lines start end))
             (from (or beg 1))
             (to (+ lines (1- from)))
             (numbers (number-sequence from to))
             (width (max (length (int-to-string lines))
                         (length (int-to-string from)))))
        (if (= start (point))
            (setq numbers (reverse numbers)))
        (goto-char start)
        (dolist (n numbers)
          (beginning-of-line)
          (save-match-data
            (if (looking-at " *-?[0-9]+\\. ")
                (replace-match "")))
          (insert (format (concat "%" (int-to-string width) "d. ") n))
          (forward-line))))
     
;;;; X-11 and Colors

;;; Emacs .Xresources
; emacs*Background: DarkSlateGray
; emacs*Foreground: Wheat
; emacs*pointerColor: Orchid
; emacs*cursorColor: Orchid
; emacs*bitmapIcon: on
; emacs*font: fixed
; emacs.geometry: 80x25

;;; Set highlighting colors for isearch and drag
(set-face-foreground 'highlight "white" )
(set-face-background 'highlight "slate blue")
(set-face-background 'region    "slate blue")
(set-face-background
 'secondary-selection "turquoise")

;;; Set calendar highlighting colors
(setq calendar-load-hook
      '(lambda ()
	 (set-face-foreground 'diary-face   "skyblue")
	 (set-face-background 'holiday-face "slate blue")
	 (set-face-foreground 'holiday-face "white")))



;;;; Mode line
; this is what appears at the bottom of each buffer

(setq mode-line-system-identification
      (substring (system-name) 0
		 (string-match "\\..+" (system-name))))
     
(setq default-mode-line-format
      (list ""
	    'mode-line-modified
	    "<"
	    'mode-line-system-identification
	    "> "
	    "%14b"
	    " "
	    'default-directory
	    " "
	    "%[("
	    'mode-name
	    'minor-mode-alist
	    "%n"
	    'mode-line-process
	    ")%]--"
	    "Line %l--"
	    '(-3 . "%P")
	    "-%-"))

; Start with new default.
(setq mode-line-format default-mode-line-format)


;;;; Extra Libraries/ Modules


;;; ispell
(load "ispell")

;;; Crypt
; (load "crypt++")

;;; x-mouse
; (require 'x-mouse)


;;; cperl mode
;;; http://www.emacswiki.org/emacs/CPerlMode
(defalias 'perl-mode 'cperl-mode)

;;; cperl settings
(setq cperl-indent-level 8)
(setq cperl-continued-statement-offset 2)
(setq cperl-brace-offset -2)
(setq cperl-label-offset -2)


;(setq load-path (cons (expand-file-name "~/Lisp") load-path))
;(autoload 'perl-mode "cperl-mode" "alternate mode for editing Perl programs" t)
;(setq cperl-hairy t)
;(setq cperl-indent-level 8)
;(setq auto-mode-alist
;      (append '(("\\.\\([pP][Llm]\\|al\\)$" . cperl-mode))  auto-mode-alist ))
; (autoload 'perl-mode "cperl-mode" "alternate mode for editing Perl programs" t)
; (setq cperl-hairy t)
; (setq auto-mode-alist
;      (append '(("\\.\\([pP][Llm]\\|al\\)$" . perl-mode))  auto-mode-alist ))
; (setq interpreter-mode-alist (append interpreter-mode-alist
;				        '(("miniperl" . perl-mode))))

(autoload 'python-mode "python-mode" "Mode for editing Python source files")
(add-to-list 'auto-mode-alist '("\\.py" . python-mode))

;;; python mode
; (autoload 'python-mode "python-mode" "Python editing mode." t)
; (setq auto-mode-alist
;       (cons '("\\.py$" . python-mode) auto-mode-alist))
; (setq interpreter-mode-alist
;       (cons '("python" . python-mode) interpreter-mode-alist))


;;; font-lock colors written by customisation interface -- do not edit!
; (custom-set-variables
;  '(frame-background-mode (quote dark)))
; (custom-set-faces
;  '(font-lock-comment-face ((t (:foreground "cyan"))))
;  '(font-lock-reference-face ((t (:foreground "Aquamarine"))))
;  '(font-lock-string-face ((t (:foreground "white"))))
;  '(font-lock-other-type-face ((t (:foreground "thistle"))) t)
;  '(region ((t (:background "slate blue"))))
;  '(font-lock-other-emphasized-face ((t nil)) t)
;  '(font-lock-keyword-face ((t (:bold nil :foreground "LightGreen"))))
;  '(font-lock-warning-face ((((class color) (background dark)) (:bold t :foreground "Pink"))))
;  '(highlight ((t (:foreground "white" :background "slate blue"))))
;  '(font-lock-emphasized-face ((t (:bold nil))) t)
;  '(font-lock-variable-name-face ((t (:foreground "thistle"))))
;  '(font-lock-function-name-face ((t (:bold nil :foreground "Pink"))))
;  '(secondary-selection ((t (:background "turquoise"))))



;;;; Keyboard Macros
; - create keyboard macro
; - name-last-kbd-macro
; - insert-kbd-macro
(fset 'todo
   "\C-x\C-f\C-a\C-k~/Red/Todo/jgriffin/todo\C-m\C-n\C-n\C-n")


;;;; Swap Backspace and Delete inside Emacs
(keyboard-translate ?\C-h ?\C-?)



; set default tab width
(setq default-tab-width 8)


; set the color theme -- nice
; (load "color-theme")
; (require 'color-theme)

; (color-theme-blue-sea)


(defun perltidy-region ()
  "Run perltidy on the current region."
  (interactive)
  (save-excursion
    (shell-command-on-region (point) (mark) "perltidy -q -i=8 -t -pt=2 -bt=2 -sbt=2 -ci=4 -noll -sfs -nasc -ce" nil t)))
(defun perltidy-defun ()
  "Run perltidy on the current defun."
  (interactive)
  (save-excursion (mark-defun)
		  (perltidy-region)))



(fset 'set-blue
   [escape ?x ?l ?o ?a ?d ?- ?l ?i ?b ?r ?a ?r ?y return ?c ?o ?l ?o ?r ?- ?t ?h ?e ?m ?e return escape ?x ?c ?o ?l ?o ?r ?- ?t ?h ?e ?m ?e ?- ?b ?l ?u ?e ?- ?s ?e ?a return])


(fset 'set-solaris
   [escape ?x ?l ?o ?a ?d ?- ?l ?i ?b ?r ?a ?r ?y return ?c ?o ?l ?o ?r ?- ?t ?h ?e ?m ?e return escape ?x ?c ?o ?l ?o ?r ?- ?t ?h ?e tab ?s ?i ?t tab ?s ?o tab return])

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ebrowse-root-class-face ((t (:foreground "yellow" :weight bold)))))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(org-agenda-files (quote ("~/Documents/grp_todo.org" "~/Documents/ee_todo.org" "~/Documents/hybrid_todo.org" "~/Documents/admin_todo.org" "~/Documents/inbox.org" "~/Documents/development_todo.org" "~/Documents/production_todo.org"))))
