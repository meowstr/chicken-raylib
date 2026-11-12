(import scheme)
(import srfi-4)
(import bind)
(import chicken.syntax)
(import chicken.base)
(import chicken.pretty-print)

(import-for-syntax chicken.pretty-print)
(import-for-syntax chicken.string)
(import-for-syntax srfi-1)
(import-for-syntax bind-translator)

(define-for-syntax (transform-prims form rename)
  (define types '(("Vector2" f32vector 2)
                  ("Vector3" f32vector 3)
                  ("Vector4" f32vector 4)
                  ("Quaternion" f32vector 4)
                  ("Matrix" f32vector 16)
                  ("Color" u8vector 4)
                  ("Rectangle" f32vector 4)
                  ))
  (define (transform-arg arg)
    (define a (and (string? (first arg)) (assoc (first arg) types string=?)))
    (cond
      ;; convert listed type into srfi-4 equivalents
      (a 
        (list (list (second a) (second arg)) 
              ;; cast from srfi-4 to c-type
              (list (second arg) 'deref (conc "((" (first a) "*)" (second arg) ")"))))
      ;; convert pass by value structs to pass by pointer structs
      ([and (pair? (first arg)) (eqv? 'struct (caar arg))]
       (list (list (list 'c-pointer (first arg)) (second arg))
             ;; deref struct pointer
             (list (second arg) 'deref (second arg))))
      (else
        (list arg (cons (second arg) (second arg))))))

  (let ([name (first form)]
        [ret (second form)]
        [args (third form)]
        [body (fourth form)])

    ;; recursively search for arg names and replace them
    (define (replace-body-arg body alist)
      (define (replacer body)
        (if (list? body)
          (map replacer body)
          (let ([m (and (symbol? body) (assoc body alist eqv?))])
            (if m
              (cdr m)
              body))))
      (replacer body))
    (define arg-transform (map transform-arg args))
    (define new-args (map first arg-transform))
    (define new-body (replace-body-arg body (map second arg-transform)))
    (define ret-assoc (and (string? ret) (assoc ret types string=?)))
    (cond
      ;; handle srfi-4 vector return values
      (ret-assoc
        (let ([m 
                (bind-foreign-lambda* 
                  `(,name void 
                          ;; add 'out to args
                          ,(cons (list (second ret-assoc) 'out) new-args) 
                          ;; *((c-type*) out) = body
                          (stmt (= (deref ,(conc "((" (first ret-assoc) "*)out)")) ,new-body))) 
                  rename)])
          `(lambda ,(map second new-args)
             ;; allocate the srfi-4 vector and pass
             (,(rename 'let) ((out (,(symbol-append 'make- (second ret-assoc)) ,(third ret-assoc)))) 
                             (,m out ,@(map second new-args))
                             out))))
      ;; handle malloc'd struct return values
      ([and (pair? ret) (eqv? 'struct (car ret))]
       (let ([struct-name (second ret)])
         (bind-foreign-lambda* 
           `(,name (c-pointer ,ret) 
                   ,new-args 
                   (stmt 
                     ,(conc "struct " struct-name " * tmp = (struct " struct-name " *) C_malloc(sizeof(struct " struct-name "))" )
                     (= (deref "tmp") ,new-body)
                     (return "tmp"))) 
           rename)))
      (else
        (bind-foreign-lambda* (list name ret new-args new-body) rename)))))

(define-for-syntax (my-transformer form rename)
  (pp form) 
  (print " => ")
  (let ([new-form (transform-prims form rename)])
    (pp new-form)
    new-form))

(bind-options foreign-transformer: my-transformer)
(bind-options mutable-fields: #t)
(bind-options export-constants: #t)

;; leave constants capitalized
(call-with-output-file 
  "bindings1.scm"
  (lambda (file)
    (for-each (cut pp <> file) 
              ;; un-rename all the symbols and clean up
              (cdr (strip-syntax (expand (syntax (bind-file "raylib1.h")))))
              )))

;; enable schemey names for everything else
(bind-options default-renaming: "")
(call-with-output-file 
  "bindings2.scm"
  (lambda (file)
    (for-each (cut pp <> file) 
              ;; un-rename all the symbols and clean up
              (cdr (strip-syntax (expand (syntax (bind-file "raylib2.h")))))
              )))
