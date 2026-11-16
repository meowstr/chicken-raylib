(include "generate-bindings.scm")

(bind-options default-renaming: "")

(call-with-output-file 
  "rcamera-bindings.scm"
  (lambda (file)
    (for-each 
      (cut pp <> file) 
      ;; un-rename all the symbols and clean up
      (cdr (strip-syntax (expand (syntax (bind-file "rcamera1.h")))))
      )))
