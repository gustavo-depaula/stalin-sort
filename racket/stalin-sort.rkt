; Implementation of Stalin Sort in Racket

(: stalin-sort ((list-of integer) -> (list-of integer)))

; Tests
(check-expect (stalin-sort (list 1 2 5 3 5 7)) (list 1 2 5 5 7))
(check-expect (stalin-sort empty) empty)
(check-expect (stalin-sort (list 1 2 3 4 5 6 7)) (list 1 2 3 4 5 6 7))
(check-expect (stalin-sort (list 1 2 3 6 5 6 7)) (list 1 2 3 6 6 7))
(check-expect (stalin-sort (list 7 2 3 4 5 6 7)) (list 7 7))

(define stalin-sort
  (lambda (ls)
    (match ls
      (empty empty)
      ((cons a empty) (cons a empty))
      ((cons a (cons b lss)) (cond
                               ((> a b) (stalin-sort (cons a lss))) ; Need to restart from the beginning whenever element is removed
                               (else (cons a (stalin-sort (cons b lss)))) ; Recursive progress, as a <= b, which now becomes the new recursive start for eliminating elements
                               ))
      )
    )
  )

