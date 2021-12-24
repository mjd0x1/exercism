(ns pangram
  (:require [clojure.set :as set]
            [clojure.string :as str]))

(defn pangram? [s] 
  (let [a (set (str/lower-case s)) b (set (map char (range 97 123)))]
    (= (count (set/difference b a)) 0)))
