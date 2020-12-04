(ns bob)
(require '[clojure.string :as str])

(defn response-for [s] 
  (let [sn (str/trim s)
        isQuestion (= (-> sn seq last) \?)
        allUpper (= (drop-last sn) (drop-last (str/upper-case sn)))
        atLeastOneLetter (some true? (map #(Character/isLetter %) sn))]
               
       (cond
         (= sn "") "Fine. Be that way!"
         (and isQuestion allUpper atLeastOneLetter) "Calm down, I know what I'm doing!"
         isQuestion "Sure."
         (and allUpper atLeastOneLetter) "Whoa, chill out!"
         :else "Whatever."))
  
)
