using Test

import Random

include("robot-name.jl")

@testset "basuc" begin
    ls  = []  
    for i = 1:1000
        push!(ls, name(Robot()))
    end
    unique(ls)
end

function test_unique()
    ls  = []  
    for i = 1:10000
        push!(ls, name(Robot()))
    end
    length(unique(ls))
end