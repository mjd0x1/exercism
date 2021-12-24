(ns hamming)

(defn distance [strand1 strand2]
  (if (= (count strand1) (count strand2))
    (apply  + (map (fn[x y] (if (not= x y) 1 0)) strand1 strand2))
    nil))
