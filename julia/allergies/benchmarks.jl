using BenchmarkTools

include("allergies.jl")

println("mjd")
@btime $allergic_to(224, "pollen")
