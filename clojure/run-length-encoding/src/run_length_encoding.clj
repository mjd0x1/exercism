(ns run-length-encoding)

(defn get-frequency [[fst & rst :as part]]
  "input a list of elements and return its frequency string"
  (cond->> fst
    (not= rst nil) (str (count part))))


(defn run-length-encode
  "encodes a string with run-length-encoding"
  [plain-text]
  (->> plain-text
       (partition-by identity)
       (map get-frequency)
       (apply str)))



(defn get-num-char [[_ n c]] (cond->> c (seq n) (repeat (read-string n))))

(defn run-length-decode
  "decodes a run-length-encoded string"
  [cipher-text]
  (->> (re-seq #"(\d*)(.)" cipher-text)
       (mapcat get-num-char)
       (apply str))) 
       
  