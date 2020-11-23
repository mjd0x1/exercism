(ns reverse-string)

(defn reverse-string [s] ;; <- arglist goes here
  (loop [acc () ls s]
     (if (= ls ())
       (apply str acc)
       (recur (cons (first ls) acc) (drop 1 ls))
       )))
