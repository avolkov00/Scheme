(define factorial (lambda (x)
	(if (= x 1) 
	   1 
		 (* x (factorial (- x 1))))
	)
)

(format #t "Factorial 6 = ~a\n" (factorial 6))

(define factorial-body (lambda (n acc)
		(if (= n 1)
		   acc
			 (factorial-body (- n 1) (* acc n))
	  )
  )			
)

(define factorial-tailrec (lambda (n)
	(factorial-body n 1))
)

(format #t "Factorial 100000 = ~a\n" (factorial-tailrec 100000))