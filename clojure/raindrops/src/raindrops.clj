(ns raindrops
  (:require [clojure.string :as str]))

(defn convert [n] 
  (let [data {3 "Pling", 5 "Plang", 7 "Plong"} 
        output (map #(if (= (mod n (first %)) 0) (last  %) "") data)]
    (if (= (str/join output) "") (str n) (str/join output))))
