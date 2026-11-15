(include "generate-bindings.scm")

(call-with-output-file 
  "raygui-bindings1.scm"
  (lambda (file)
    (for-each 
      (cut pp <> file) 
      ;; un-rename all the symbols and clean up
      (cdr (strip-syntax (expand (syntax (bind-file "raygui1.h")))))
      )))

(bind-options default-renaming: "")

(call-with-output-file 
  "raygui-bindings2.scm"
  (lambda (file)
    (for-each 
      (cut pp <> file) 
      ;; un-rename all the symbols and clean up
      (cdr (strip-syntax (expand (syntax (bind-file "raygui2.h")))))
      )))
