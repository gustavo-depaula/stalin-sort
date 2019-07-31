(ns stalin-sort)

(defn lazy [coll]
  (if (empty? coll)
    []
    (let [[f & rs] coll]
      (->> rs (filter #(<= f %)) lazy (cons f) lazy-seq))))

(defn strict [coll]
  (if (empty? coll)
    []
    (reduce #(cond-> %1 (<= (peek %1) %2) (conj %2)) [(first coll)] (rest coll))))
