include("anagram.jl")

using BenchmarkTools

for x in [detect_anagrams,detect_anagrams2,detect_anagrams3,detect_anagrams4,detect_anagrams5]
    println(x)
    @btime $x("allergy", ["gallery", "ballerina", "regally", "clergy", "largely", "leading"])
end