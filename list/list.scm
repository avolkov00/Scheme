(define data '(1 2 3 4 5 6 7 8 9 0))

(define Reverse 
    (lambda (l)
    (let loop((l l)(res '()))
        (if (null? l) res
            (loop (cdr l) (cons (car l) res))))))

(format #t "Reverse ~a\n" (Reverse data))

(define get-by-cond
    (lambda (cond l)
        ; (format #t "Data to get by cond:\t ~a\n" l)
        (if (null? l)
            '()
            (if (cond (car l))
                    (cons (car l) (get-by-cond cond (cdr l)))
                    (get-by-cond cond (cdr l))
            )
        )
    )
)

(define quicksort 
    (lambda (l)
        ; (format #t "Data to quicksort:\t ~a\n" l)
        (if (null? l) 
            '()
            (append
                (append (quicksort (get-by-cond (lambda (i) (< i (car l))) (cdr l)))
                        (get-by-cond (lambda (i) (= i (car l))) l)
                )  
                        (quicksort (get-by-cond (lambda (i) (> i (car l))) (cdr l)))
            )
        )
    )
)

(define rand-data '(5 1 4 9 2 3 8 0 7 3))

(format #t "Raw data:\t ~a \nSorted data:\t ~a \n" rand-data (quicksort rand-data))
