(define Pi 3.14159265359)
(let trigonom( (i 0))
 (if (<= i 180)
  (begin 
      (format #t "a = ~3a;\t sin(a)=~5f;\t cos(a)=~5f;\t tan(a)=~5f\n"
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
