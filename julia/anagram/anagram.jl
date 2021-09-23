
"function to return list of anagrams of subject with hash map"
detect_anagrams4(subject, candidates)  = filter(x -> is_anagram4(x, subject), candidates)
"function to return list of anagrams of subject with dict"
detect_anagrams2(subject, candidates)  = filter(x -> is_anagram2(x, subject), candidates)
"function to return list of anagrams of subject with sort!"
detect_anagrams3(subject, candidates)  = filter(x -> is_anagram3(x, subject), candidates)
"function to return list of anagrams of subject with sort! and pre-compute subject"
detect_anagrams5(subject, candidates)  = begin
    upper = uppercase(subject)
    sorted_upper = sort!(collect(uppercase(subject)))
    filter(x -> is_anagram5(x, upper, sorted_upper), candidates)
end

"function to return list of anagrams of subject with sort! remove function/filter and only calc upper once in loop"
detect_anagrams(subject, candidates)  = begin
    anagrams =  []
    upper = uppercase(subject)
    sorted_upper = sort!(collect(uppercase(subject)))
    for x in candidates
        candidate_upper = uppercase(x)
        if sort!(collect(candidate_upper)) == sorted_upper && candidate_upper != upper
          push!(anagrams, x)
        end
    end
    anagrams
end

    
string_dict = word -> Dict((x, count(t -> t == x, word)) for x in word)
is_anagram2  = (w1, w2) -> string_dict(uppercase(w1)) == string_dict(uppercase(w2)) && uppercase(w1) != uppercase(w2)
is_anagram4 = (w1, w2) -> sum(Int.(collect(uppercase(w1))).^2) ==  sum(Int.(collect(uppercase(w2))).^2) && uppercase(w1) != uppercase(w2)
is_anagram3 = (w1, w2) -> sort!(collect(uppercase(w1))) == sort!(collect(uppercase(w2))) && uppercase(w1) != uppercase(w2)
is_anagram5 = (w, upper, sorted_upper) -> sort!(collect(uppercase(w))) == sorted_upper && uppercase(w) != upper


#= 
etect_anagrams
  1.526 μs (41 allocations: 2.59 KiB)
detect_anagrams2
  5.184 μs (104 allocations: 8.89 KiB)
detect_anagrams3
  2.951 μs (80 allocations: 4.78 KiB)
detect_anagrams4
  2.985 μs (80 allocations: 5.53 KiB)
detect_anagrams5
  1.919 μs (49 allocations: 2.97 KiB) =#