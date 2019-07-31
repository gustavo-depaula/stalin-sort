(defun stalin-sort (list)
  (let ((first (car list))
	(rest  (cdr list)))
    (cond ((null rest) list)
	  ((>= first (car rest))
	   (stalin-sort (cons first (cdr rest))))
	  (t (cons first (stalin-sort rest))))))

(defun run-tests ()
  "Runs test cases, copied from the Perl example."
  (mapc (lambda (test-case)
	  (format t "Original list: ~a~%Sorted list:   ~a~%~%"
		  test-case
		  (stalin-sort test-case)))
	'((1 2 4 3 6 8 0 9 5 7)
	  (9 8 7 6 5 4 3 2 1 0)
	  (1 3 2 5 4 7 0 9 8 6))))

