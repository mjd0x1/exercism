(ns matching-brackets)

(defn valid? [s]
  (let [brackets {"]" "[", "}" "{", ")" "("}
        cleaned  (re-seq #"\{|\}|\[|\]|\(|\)" s)]
    (loop [[x & xs] cleaned acc [""]]
      (if (nil? x)
        (= (count acc) 1)
        (recur xs (if (= (brackets (str x)) (last acc)) (pop acc) (conj acc (str x))))))))
        

