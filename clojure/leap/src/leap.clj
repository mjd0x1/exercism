(ns leap)

(defn leap-year? [year] 
 (and (= (mod year 4) 0) (> (mod year 100) 0) (and (= (mod year 100) 0) (= (mod year 400) 0))))


