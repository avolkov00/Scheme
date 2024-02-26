(define data '(1 2 3 4 5 6 7 8 9 0))

(define Reverse 
    (lambda (l)
    (let loop((l l)(res '()))
        (if (null? l) res
            (loop (cdr l) (cons (car l) res))))))

(format #t "Reverse ~a\n" (Reverse data))

; (define QuickSort
;     (lambda (l)
;         (let quick-sort-3  ((left-part )))
;     ))

(define get-by-cond 
    (lambda (cond l)
        (if (null? l) 
            '()
            (if (cond (car l)) 
                (cons (car l) (get-by-cond cond (cdr l)))
                (get-by-cond cond (cdr l))
            )
        )
    )
)

(define separate 
    (lambda (l)
        (if (null? l) 
            '()
            (append
                (append (separate (get-by-cond (lambda (i) (< i (car l))) (cdr l)))
                        (separate (get-by-cond (lambda (i) (= i (car l))) (cdr l)))
                )  
                        (separate (get-by-cond (lambda (i) (> i (car l))) (cdr l)))
            )
        )
    )
)

(define rand-data '(5 1 4 9 2 3 8 0 7 3))

(format #t "Raw data:\t ~a \nSorted data:\t ~a \n" rand-data (separate data))
