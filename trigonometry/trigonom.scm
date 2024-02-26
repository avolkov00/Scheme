(define Pi 3.14159265359)
(let trigonom( (i 0))
 (if (<= i 180)
  (begin 
      (format #t "a = ~a; sin(a)=~a; cos(a)=~a; tan(a)=~a\n"
                i 
                (sin (* (/ i 180.0) Pi))
                (cos (* (/ i 180.0) Pi))
                (tan (* (/ i 180.0) Pi))
      ) 
      (trigonom (+ i 5))
  )
  'quit
 )
)




