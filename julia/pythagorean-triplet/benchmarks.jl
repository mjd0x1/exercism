using BenchmarkTools

include("pythagorean-triplet.jl")

@btime $pythagorean_triplets(30000)