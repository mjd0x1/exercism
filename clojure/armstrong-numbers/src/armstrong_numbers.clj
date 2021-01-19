(ns armstrong-numbers)

(defn get-digits [n]
  (->>  n
        (iterate #(quot % 10))
        (take-while pos?)
        (map #(mod % 10))))
   

(defn armstrong? [num]
  (let [digits (get-digits num) pow (count digits)]
   (->> digits
        (map #(apply * (repeat pow %)))
        (apply +)
        (= num))))
