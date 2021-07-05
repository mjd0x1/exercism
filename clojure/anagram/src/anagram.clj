(ns anagram
  (:require [clojure.string :as str]))

(defn compare-words [word1 word2]
   (let [target1 (str/lower-case word1)
         target2 (str/lower-case word2)]
     (and (= (sort target1) (sort target2))
          (not= target1 target2))))

(defn anagrams-for [word prospect-list]
  (filter #(compare-words word %) prospect-list))
