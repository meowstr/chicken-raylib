(include "generate-bindings.scm")

(bind-rename/pattern "([a-z0-9])([A-Z])" "\\1-\\2")
(bind-options default-renaming: "")

(call-with-output-file 
  "raymath-bindings.scm"
  (lambda (file)
    (for-each 
      (cut pp <> file) 
      ;; un-rename all the symbols and clean up
      (cdr (strip-syntax (expand (syntax (bind-file "raymath1.h")))))
      )))
