(ns rna-transcription)

(require '[clojure.string :as string])

(defn process [dna]
  (map {\C "G" \G "C" \T "A" \A "U"} dna))

(defn to-rna [dna]
  (let [p (->  (process dna) string/join)]
    (assert (= (count dna) (count p)))
    p))
