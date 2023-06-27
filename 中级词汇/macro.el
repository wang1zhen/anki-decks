(fset 'hiragana
      (kmacro-lambda-form [?\C-e ?, delete ?\C-e ?, delete ?\C-n ?\C-a] 0 "%d"))
(general-def "<f11>" #'hiragana)

(fset 'katakana
   (kmacro-lambda-form [?\C-e ?, ?, delete ?\C-n] 0 "%d"))
(general-def "<f12>" #'katakana)

(fset 'br
   (kmacro-lambda-form [?\C-e ?< ?b ?r ?> delete] 0 "%d"))
(general-def "<f9>" #'br)
