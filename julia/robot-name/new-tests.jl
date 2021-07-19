using Base: valid_import_path
using Test

import Random

include("robot-name.jl")

# Random names means a risk of collisions.
const history = Set{String}()

isname(x) = occursin(r"^[A-Z]{2}[0-9]{3}$", x)

@testset "fresh names of reset robots are valid and unique in history" begin
    Random.seed!()
    robots = Robot[]

    for i in 1:100
        push!(robots, Robot())
    end

    for r in robots
        reset!(r)
        @test isname(name(r))
        @test !in(name(r), history)
        push!(history, name(r))
    end
end