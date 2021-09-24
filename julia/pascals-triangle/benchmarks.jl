using BenchmarkTools 

include("pascals-triangle.jl")

for f in [triangle,triangle1]
    println(f)
    @btime $f(10)
end