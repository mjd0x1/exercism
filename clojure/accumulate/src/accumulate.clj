(ns accumulate)

(defn accumulate [f coll]
  (loop [output [] [x & xs] coll]
    (if (= x nil)
      output
      (recur (conj output (f x)) xs))))

