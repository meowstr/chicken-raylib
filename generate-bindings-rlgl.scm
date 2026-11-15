(include "generate-bindings.scm")

(call-with-output-file 
  "rlgl-bindings1.scm"
  (lambda (file)
    (for-each 
      (cut pp <> file) 
      ;; un-rename all the symbols and clean up
      (cdr (strip-syntax (expand (syntax (bind-file "rlgl1.h")))))
      )))

;; use different pattern for raymath
(bind-options default-renaming: "")

(call-with-output-file 
  "rlgl-bindings2.scm"
  (lambda (file)
    (for-each 
      (cut pp <> file) 
      ;; un-rename all the symbols and clean up
      (cdr (strip-syntax (expand (syntax (bind-file "rlgl2.h")))))
      )))
