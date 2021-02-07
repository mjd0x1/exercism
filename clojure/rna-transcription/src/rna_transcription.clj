(ns rna-transcription)

(require '[clojure.string :as string]
          '[clojure.walk :as walk])

(defn process [dna] 
  (map #((walk/stringify-keys {:C "G" :G "C" :T "A" :A "U"}) (str %1)) dna))

(defn to-rna [dna] 
       (let [p (process dna)] 
          (if (some nil? p) (throw (AssertionError. "incorrect nucleotide.")) (string/join p))))
