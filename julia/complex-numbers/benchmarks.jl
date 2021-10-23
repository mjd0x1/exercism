using BenchmarkTools

include("complex-numbers.jl")

println("*")
@btime  *(ComplexNumber(3, 4), ComplexNumber(3, 4))

println("/")
@btime  /(ComplexNumber(3, 4), ComplexNumber(3, 2))