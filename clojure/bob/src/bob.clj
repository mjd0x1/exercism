(ns bob)
(require '[clojure.string :as str])

(defn- question? [s] 
  (str/ends-with? s "?"))
(defn- all-upper? [s] 
  (= s (str/upper-case s)))
(defn- includes-one-letter? [s] 
  (seq (filter #(Character/isLetter %) s)))
(def silence? str/blank?)
(defn- shouting? [s]
  (and (all-upper? s) (includes-one-letter? s)))
(defn- forceful-question? [s] 
  (and (question? s) (shouting? s)))


(defn response-for [s] 
  (let [sn (str/trim s)]
       (cond
         (silence? sn) "Fine. Be that way!"
         (forceful-question? s) "Calm down, I know what I'm doing!"
         (question? sn) "Sure."
         (shouting? sn) "Whoa, chill out!"
         :else "Whatever.")))
