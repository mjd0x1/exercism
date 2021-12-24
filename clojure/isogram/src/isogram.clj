(ns isogram
  (:require [clojure.string :as str]))

(defn isogram? [s]
  (let [cleaned (str/lower-case (str/join (re-seq #"\p{L}" s)))] 
    (= ((apply max (vals (frequencies cleaned))) 1))))
