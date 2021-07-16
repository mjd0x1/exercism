(ns anagram
  (:require [clojure.string :as str]))


(defn anagram? [sorted-word lower-word word]
   (let [lower (str/lower-case word)]
     (and (= sorted-word (sort lower))
          (not= lower-word lower))))

(defn anagrams-for [word prospect-list]
  (let [lower-word (str/lower-case word)
        sorted-word (-> lower-word sort)
        check-anagram (partial anagram? sorted-word lower-word)]
    (filter check-anagram prospect-list)))
