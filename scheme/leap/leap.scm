(import (rnrs))

(define (leap-year? year)
  (cond
    [(and (= (remainder year 4) 0) (> (remainder year 100) 0) (> (remainder year 400) 0)) #true]
    [(and (= (remainder year 4) 0) (> (remainder year 100) 0) (= (remainder year 400) 0)) #true]
    [(and (= (remainder year 4) 0) (= (remainder year 100) 0) (= (remainder year 400) 0)) #true]
    [else #f]))

