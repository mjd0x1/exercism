(ns acronym
(:require [clojure.string :as str]))

(defn acronym [s] 
  (-> (map last (re-seq #"[ |-]\w|[a-z][A-Z]" (str " " s)))
   str/join
   str/upper-case))
