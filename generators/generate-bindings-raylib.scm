(include "generate-bindings.scm")

(call-with-output-file 
  "bindings1.scm"
  (lambda (file)
    (for-each 
      (cut pp <> file) 
      ;; un-rename all the symbols and clean up
      (cdr (strip-syntax (expand (syntax (bind-file "raylib1.h")))))
      )))

(bind-options default-renaming: "")

(call-with-output-file 
  "bindings2.scm"
  (lambda (file)
    (for-each 
      (cut pp <> file) 
      ;; un-rename all the symbols and clean up
      (cdr (strip-syntax (expand (syntax (bind-file "raylib2.h")))))
      )))
