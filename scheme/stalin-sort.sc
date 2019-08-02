(define (stalin-sort lst proc)
  (let ((head (car lst)) (tail (cdr lst)))
    (cond
     ((null? lst)
      (list))
     ((null? tail)
      (list head))
     ((proc head (car tail))
      (cons head (stalin-sort tail proc)))
     (else
      (stalin-sort tail proc)))))

(define (test)
  (display (stalin-sort '(1 2 3 3 5 4) <=))
  (newline)
  (display (stalin-sort '("bar" "foo" "baz" "quux") string<?))
  (newline)
  (display (stalin-sort '(8.7 8.7 5.3 2.6) >))
  (newline))

(test)

;;; Usage:
;; % stalin -version
;; 0.11
;; % stalin -On -architecture amd64 stalin-sort.sc
;; % ./stalin-sort
;; (1 2 3 3 4)
;; (bar baz quux)
;; (8.69999980926513671875 5.30000019073486328125 2.599999904632568359375)
