(defun my/hiragana nil
  (interactive)
  (move-end-of-line nil)
  (insert ",")
  (delete-forward-char 1)
  (move-end-of-line nil)
  (insert ",")
  (delete-forward-char 1)
  (next-line)
  (move-beginning-of-line nil))

(defun my/katakana nil
  (interactive)
  (move-end-of-line nil)
  (insert ",")
  (delete-forward-char 1)
  (next-line)
  (move-beginning-of-line nil))

(defun my/br nil
  (interactive)
  (move-end-of-line nil)
  (insert "<br>")
  (delete-forward-char 1))

(global-set-key [f11] 'my/hiragana)
(global-set-key [f12] 'my/katakana)
(global-set-key [f9] 'my/br)
