; call-with-current-continuation
; call/cc

; (call/cc (lambda (c)
    ; ...
    ; ))

; https://ds26gte.github.io/tyscheme/index-Z-H-15.html#TAG:__tex2page_sec_13.1

(display
(+ 1 (call/cc
       (lambda (k)
         (+ 2 (k 3)))))
) (newline)

(define context #f)

(display
    (+ 1 (call/cc
        (lambda (k)
            (set! context k)
            (+ 2 (k 3)))))
) (newline)

; (display (context 1)) (newline)
; (display (context 10)) (newline) улетает в рекурсию \_|-_-|_/
; (display (context 100)) (newline)

; https://learn.microsoft.com/ru-ru/cpp/c-runtime-library/reference/setjmp?view=msvc-170 нелокальные переходы

(define Data '(1 2 3 4 5 6 7))


(define (make-list-iterator l)
    (let ((return-to-caller #f))
        (letrec ((get-next-proc
            (lambda ()
                (let loop ((l l))
                    (if (null? l) 'end
                        (begin 
                            (call/cc
                                (lambda (continue)
                                    (set! get-next-proc (lambda () (continue 'dummy)))
                                    (return-to-caller (car l))    
                                )
                            )
                            (loop (cdr l))
                        )
                    )
                )
            )
            ))
            ;; 
            (lambda ()
                (call/cc (lambda (caller)
                (set! return-to-caller caller)
                (get-next-proc)))    
            )    
        )
    )

)

(let ((get-next (make-list-iterator Data)))
    (let loop ((e (get-next)))
        (if (eq? e 'end) 'end
            (begin (display e) (newline) (loop (get-next)))
        )
    )
)


(define Tree '(
							 ( 
								(() 4 ()) 
								2 
								(() 5 ()) 
							 ) 
							 1 
							 ( 
								(() 6 ()) 
								3 
								(() 7 ())
							 )
							)
)
(define left-branch car)
(define right-branch caddr)
(define node-value cadr)	


(format #t "Tree: ~a\n" Tree)

(display "Recursive traverse:")(newline)

(define (Traverse-rec tree callback) 
 (if (not (null? tree))
	(begin
	 (Traverse-rec (left-branch tree) callback)
	 (callback (node-value tree))
	 (Traverse-rec (right-branch tree) callback)
	)
 )
)

(define (print-key k) (display k)(newline))
(Traverse-rec Tree print-key)

;;(quit)

(define (make-tree-iterator tree)
 (let ((caller #f))
  (letrec ((traverse  ;; traverse procedure
						(lambda ()
						 (let loop ((tree tree))
							(if (not (null? tree))
							 (begin
								(loop (left-branch tree))
								;; -- do st-th with key
								(call/cc (lambda (rest-of-tree) 
													(set! traverse (lambda () (rest-of-tree 'dummy)))
													(caller (node-value tree))
												 )
								)
								(loop (right-branch tree))
							 )
							)
						 )
						 (caller 'end)
							
						)
					)) ;; letrec

	 (lambda () ;; iterator procedure
		(call/cc (lambda (k) (set! caller k) (traverse)))
	 ) ;; iterator proc end
	)
 )
)

(display "Iterating:")(newline)
(define get-next-key (make-tree-iterator Tree))
(display (get-next-key))(newline)
(display (get-next-key))(newline)
(display (get-next-key))(newline)
(display (get-next-key))(newline)
(display (get-next-key))(newline)
(display (get-next-key))(newline)
(display (get-next-key))(newline)
(display (get-next-key))(newline)
(display (get-next-key))(newline)
(display (get-next-key))(newline)



