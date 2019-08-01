(defun stalin-sort (seq)
  (loop with y = nil
        for x across (coerce seq 'vector)
        unless (and y (< x y))
          do (setf y x) and collect x))
