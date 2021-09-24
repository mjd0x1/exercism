using BenchmarkTools

include("prime-factors.jl")

for f in  [prime_factors,prime_factors2,prime_factors3]
    println(f)
    @btime $f(901255)
end