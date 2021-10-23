using BenchmarkTools

include("spiral-matrix.jl")

@btime spiral_matrix(20)