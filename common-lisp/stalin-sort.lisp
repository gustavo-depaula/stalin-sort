(defun stalin-sort (list)
  (unless (null list)
    (cons (car list)
	  (loop for (a b) on list while b
	     when (>= b a) collect b))))

(defun run-tests ()
  "Runs test cases, copied from the Perl example."
  (mapc (lambda (test-case)
	  (format t "Original list: ~a~%Sorted list:   ~a~%~%"
		  test-case
		  (stalin-sort test-case)))
	'((1 2 4 3 6 8 0 9 5 7)
	  (9 8 7 6 5 4 3 2 1 0)
	  (1 3 2 5 4 7 0 9 8 6))))

