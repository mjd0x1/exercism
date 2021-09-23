"calculate hamming distance"
function distance(strand_1::String, strand_2::String)
    if length(strand_1) != length(strand_2) throw(ArgumentError("Require equal length of vectors")) end
    s1 =  Int.(collect(strand_1))
    s2 = Int.(collect(strand_2))
    sum(s1 .- s2 .!= 0) 
end
