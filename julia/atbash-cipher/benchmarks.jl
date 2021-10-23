using BenchmarkTools

include("atbash-cipher.jl")
@btime $encode("The quick brown fox jumps over the lazy dog.")
