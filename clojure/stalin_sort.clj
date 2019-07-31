(ns stalin-sort)

(defn stalin-sort [coll]
  (if (empty? coll)
    []
    (let [[f & rs] coll]
      (->> rs (filter #(<= f %)) stalin-sort (cons f) lazy-seq))))
