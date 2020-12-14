(ns armstrong-numbers)


(defn armstrong? [num] 
   (let [s (str num)]
     (== (reduce #(+ %1 (Math/pow (- (int %2) 48) (count s))) 0 s) num)
))
