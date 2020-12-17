(ns armstrong-numbers)

(defn get-digits [n]
  
    (let [k (int (Math/log10 (max n 1)))
          max-n (.pow (BigInteger. (str 10)) k)]

      (-> (take (+ k 2) (iterate (fn [[num divisor output]] [(mod num divisor),(/ divisor 10),(conj output (quot num divisor))]) [n,max-n,[]]))
          last
          last
      )
    
))

(defn armstrong? [num] 
   (let [d (get-digits num)]
     (== (reduce #(+ %1 (Math/pow %2 (count d))) 0 d) num)
))
