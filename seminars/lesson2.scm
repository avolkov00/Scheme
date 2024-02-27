(define Square_expr (lambda (a b c)
    (let ((D (- (* b b) (* 4 a c))))
        (cond 
            ((< D 0) (list ))
            ((= D 0) (list (/ (- b) (* 2 a))))
            (else (list 
                (/ (+ (- b) (sqrt D)) (* 2 a))
                (/ (- (- b) (sqrt D)) (* 2 a))
                    )
            )
        )
    )
    )
)

(format #t "X^2+3X-2 : ~a\n" (Square_expr 1 3 -2))
(format #t "X^2+2X+1 : ~a\n" (Square_expr 1 2 1))
(format #t "X^2+2X+3 : ~a\n" (Square_expr 1 2 3))

; (let (())
;     (define Pi 3.141592654)
;     (define Square (lambda (r) (* Pi r r)))
; )

(define MakeAdder (lambda (N) 
    (lambda (x) (+ x N))
))

(define Add10 (MakeAdder 10))  ; замыкание - это когда функция использует свободную переменную
(define Add100 (MakeAdder 100)) ; переменная замкута на какой то контекст

(format #t "5 + 10 = ~a\n" (Add10 5))
(format #t "5 + 100 = ~a\n" (Add100 5))
(format #t "5 + 100 = ~a\n" ((MakeAdder 100) 5))



(let* ((a 1)(b (+ a 1))) 
    (format #t "1 + 1 + 1 = ~a\n" (+ a b))
)
(let ((a 1))
    (let ((b (+ a 1)))
    (format #t "1 + 1 + 1 = ~a\n"(+ a b))
    )
)

; cycle 0 .. 10

(letrec (
            (Loop (lambda (i) 
                (if (< i 10)
                    (begin 
                     (format #t "~a\n" i)
                     (Loop (+ i 1)))
            'quit
            )))
        
        )
    (Loop 0)
)

(let Loop2 ((i 0))
    (if (< i 10)
    (begin (format #t "~a\n" i) (Loop2 (+ i 1) )) ; begin последовательно выполняет аргументы
    'quit)
)
(let Loop2 ((i 0) (j 0) (k 0))
    (cond 
        ((and (< i 10) (< j 10) (< k 10)) (begin (format #t "i = ~a; j = ~a; k = ~a; \n" i j k) (Loop2 (+ i 1) j k ))) ; begin последовательно выполняет аргументы
        ((and (< j 10) (< k 10)) (Loop2 0 (+ j 1) k )) ; begin последовательно выполняет аргументы
        ((< k 10) (Loop2 0 0 (+ k 1) )) ; begin последовательно выполняет аргументы
        ; else ('quit)
    )
)