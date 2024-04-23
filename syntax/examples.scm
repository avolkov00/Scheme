#!/usr/bin/guile --no-auto-compile 
!#

(define-syntax std::ostream 
 (syntax-rules ( <<  endl  cout )
  ((_ cout << e* ...)    (std::ostream (current-output-port) << e* ...) )
  ((_ p << endl)         (newline   p) )
  ((_ p << e)            (display e p) )
	((_ p << e << e* ... ) (begin (std::ostream p << e) (std::ostream p << e* ... ) ))
 )
)

(std::ostream 
 cout << endl << endl << 10 << endl << endl
)

(define-syntax inf-calc
 (syntax-rules ()
  ((_) 0)
	((_ e) e)
	((_ e1 + e2 e* ...)   (let ((t (+ e1 e2))) (inf-calc t e* ...)))
	((_ e1 - e2 e* ...)   (let ((t (- e1 e2))) (inf-calc t e* ...)))
	((_ e1 * e2 e* ...)   (let ((t (* e1 e2))) (inf-calc t e* ...)))
	((_ e1 / e2 e* ...)   (let ((t (/ e1 e2))) (inf-calc t e* ...)))
 )
)

(std::ostream 
	  cout
		  << "Hello" 
			<< " "
			<< "World!"
			<< endl
			<< "The result of expression of ( 2 + 2 ) is "
			<< (inf-calc 2 + 2)
			<< endl
)

(call-with-output-file "out.txt" 
 (lambda (p)
  (std::ostream p 
    << "Output to out.txt" << endl
	  << "The answer to question about love universe and everything is "
	  << (inf-calc 4 * 10 + 2) << endl
	)
 )
)


