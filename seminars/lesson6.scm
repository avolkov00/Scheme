; Карринг, Коррирование, Curry

; F(A,B)  ->  F_a(B)

(lambda (arg1)
    (lambda (arg2)
        (+ arg1 arg2))
)

(define data '(1 2 3 4 5 6 7 8))

(display (map (lambda (x) (expt x 2)) data))                    (newline)

(define curry2 (lambda (a) (lambda (b) (lambda (x) (a x b)))))

(display (((curry2 expt) 2) 3))                                 (newline)

(define sqr ((curry2 expt) 2))

(display (sqr 5))                                               (newline)

(display (map sqr data))                                        (newline)