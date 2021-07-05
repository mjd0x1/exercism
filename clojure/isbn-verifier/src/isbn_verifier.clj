(ns isbn-verifier
  (:require [clojure.string :as str]))
  
(defn get-hash-value [s]
  (->> s
       (map #(if (= % \X) 10 (Character/digit % 10)))
       (map * (range 10 0 -1))
       (apply +)))

  
(defn isbn? [isbn]
  (let [target (->> (str/replace isbn "-" "") (re-matches #"^\d{9}[\d+|X]$"))]
    (and (some? target)
         (zero? (mod (get-hash-value target) 11)))))
           
          
      