using BenchmarkTools
using Profile

include("robot-name.jl")

@time generate_list()
@profile generate_list()
Profile.print()


