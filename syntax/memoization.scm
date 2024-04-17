

(define memoize
  (lambda (f)
    (let ((cache))
        (lambda (n)
          (if (eq? (assq  cache n) #f)
              (assq-set!  cache-list  n (f n))
              (assq-ref  cache n))))))


(define fib
  (lambda (n)
    (if (or (= n 1)
            (= n 2))
        1
        (+ (fib (- n 1))
           (fib (- n 2))))))


(define fib (memoize fib))

(display (fib 10))
