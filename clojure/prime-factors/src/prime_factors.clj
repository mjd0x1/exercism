(ns prime-factors)

(defn of [number]
  (loop [output [] n number divisor 2]
   (let [check (= (mod n divisor) 0)] 
    (if (= n 1) 
      output
      (recur (if check (conj output divisor) output) (if check (quot n divisor) n) 
        (if check divisor (inc divisor)))))))
 