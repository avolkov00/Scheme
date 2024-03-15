(format  #t "SIN: ~a\n" (apply sin (list 1))) 
(format  #t "5! ~a\n" (apply * (list 1 2 3 4 5))) 


 (for-each display (list 1 2 3 4 5)) 
 (for-each (lambda (x) (format  #t "~a\n" x)) (list 1 2 3 4 5)) 

(map (lambda (x y) (format  #t "~a ~a\n" x y)) (list 1 2) (list 1 2)) ;применяем по 1 аргументу из списка

; TODO: дз реализовать через map сложение, умножение, вычитание, детерминант? матриц 2x2, где матрицы (вложенные списки) матрицы квадратные
; длину узнаем через len
        
(define (make-v2 x y)
    (let ((X x) (Y y))
        (define (GetX) X)
        (define (GetY) Y)
        (define (plus v2)
            (make-v2 (+ (v2 'GetX) X) (+ (v2 'GetY) Y) ))
        (define (scalar v2)
            (+ (* (v2 'GetX) X) (* (v2 'GetY) Y)))
        (define (Display) (format #t "(~a; ~a)" X Y))
        
        
        (lambda args
            (apply 
                (case (car args)
                    ((GetY) GetY)
                    ((GetX) GetX)
                    ((plus) plus)
                    ((scalar) scalar)
                    ((Display) Display)
                    (else (begin (display "Invalid method\n") (exit 1)))
                )
                (cdr args)
            )
        )
    )
)

(define V1 (make-v2 1 0))
(define V2 (make-v2 0 1))

(V1 'Display)                   (newline)
(V2 'Display)                   (newline)

((V1 'plus V2) 'Display)        (newline)
(display (V1 'scalar V2))       (newline)