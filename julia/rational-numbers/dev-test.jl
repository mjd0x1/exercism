using Test

include("rational-numbers.jl")

@testset "Arithmetic" begin
    @test RationalNumber(1, 2) * RationalNumber(1, 2) ==  RationalNumber(1, 4)
    @test RationalNumber(2, 3) * RationalNumber(1, 3) ==  RationalNumber(2, 9)
    @test RationalNumber(6, 8) ==  RationalNumber(3, 4)
    @test RationalNumber(1, 2) +  RationalNumber(1, 4) == RationalNumber(3, 4)
    @test RationalNumber(1, 2) -  RationalNumber(1, 2) == RationalNumber(0, 0)
    @test RationalNumber(1, 2) / RationalNumber(1, 2) == RationalNumber(1, 1)
    @test RationalNumber(1, 2) - RationalNumber(2, 3) == RationalNumber(-1, 6)
    @test RationalNumber(-1, 2)^3 == RationalNumber(-1, 8)
    8^RationalNumber(4, 3) ≈ 15.999999999999998
    abs(RationalNumber(-1,  2)) == RationalNumber(1, 2)
    r = RationalNumber(3, -9)
    @test numerator(r)   == -1
    @test denominator(r) ==  3
    @test sprint(show, RationalNumber(-2500, 5000)) == "-1//2"

end
