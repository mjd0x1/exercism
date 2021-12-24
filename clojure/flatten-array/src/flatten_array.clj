(ns flatten-array)



(defn flatten [arr] 
  (loop [[x & xs] arr output []]
    (if (nil? x)
      output
      (recur xs (if (vector? x) 
                  (let [v (flatten-array/flatten x)]
                  (concat output v)) 
                  (conj output x))))))

      
        


(defn flatten-str [arr] 
  (->> (str arr)
       (re-seq #"-*\w*\.*\w*") 
       (filter #(and (not= "" %) (not= "nil" %))) 
       (map #(if (number? (read-string %)) (read-string %) %))))
