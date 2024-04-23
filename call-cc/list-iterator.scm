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
	 ;; iterator c-tor
	 (lambda ()
		(call/cc (lambda (caller)
							(set! return-to-caller caller)
							(get-next-proc)
						 )
		)
	 )
  )
 )
)



(let ((get-next (make-list-iterator Data)))
 (let loop ((e (get-next)))
	(if (eq? e 'end) 'end 
	 (begin (display e)(newline)(loop (get-next)))
  )
 )	
)
