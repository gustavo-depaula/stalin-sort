;; Stalin-sort implementation in standard R7RS Scheme.
;; 2019-08-02 Sudarshan S Chawathe <chaw@eip10.org>

;; This implementation is single-pass (true to the problem statement) and
;; tail-recursive (works on large inputs).

(import (scheme base)
        (scheme write)
        (only (srfi 1) iota))

(define (stalin-sort items item<?)
  (if (null? items)
      items
      (let ((survivors (list (car items))))
        (let loop ((unseen (cdr items))
                   (current survivors))
          (cond ((null? unseen)
                 survivors)
                ((item<? (car unseen) (car current))
                 (loop (cdr unseen) current))
                (else
                 (set-cdr! current (list (car unseen)))
                 (loop (cdr unseen) (cdr current))))))))

(define (test-stalin-sort)
  (display (map stalin-sort
                (list (iota 10) (iota 10) '(4 2 3 6 1 5) (iota #e1e6))
                (list < > < >)))
  (newline)
  (display (length (stalin-sort (iota #e1e6) <)))
  (newline))

(test-stalin-sort)

