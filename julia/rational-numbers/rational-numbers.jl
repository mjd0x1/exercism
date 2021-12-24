import Base:+,-,*,^,/,≈,==,exp,abs, sqrt,show
import Printf: @sprintf

struct RationalNumber{T<:Integer} <: Real
    numerator::T
    denominator::T
    
    RationalNumber(a,b) = begin
        if b ==0 throw(ArgumentError("denominator must be positive")) end
        n = gcd(a,b)
        RationalNumber{T}(a,b) where (T<:Integer) = new(div(a,n),div(b,n))
    end
end

+(a::RationalNumber, b::RationalNumber) =  RationalNumber(a.numerator * b.denominator  + b.numerator *a.denominator, a.denominator * b.denominator)
*(a::RationalNumber, b::RationalNumber) =  RationalNumber(a.numerator * b.numerator , a.denominator * b.denominator)
-(a::RationalNumber, b::RationalNumber) =  RationalNumber(a.numerator * b.denominator  - b.numerator * a.denominator, a.denominator * b.denominator)
/(a::RationalNumber,b::RationalNumber) =  RationalNumber(a.numerator * b.denominator , a.denominator * b.numerator)
^(a::Number,b::RationalNumber) = a^(b.numerator/b.denominator)
^(a::RationalNumber,b::Number) = RationalNumber(a.numerator ^ b,a.denominator ^ b)
^(a::RationalNumber,b::Integer) = RationalNumber(a.numerator ^ b,a.denominator ^ b)
abs(a::RationalNumber) = RationalNumber(abs(a.numerator),abs(a.denominator))

one(r::RationalNumber) = r.numerator == r.denominator
zero(r::RationalNumber) = r.numerator == 0
numerator(r::RationalNumber) = RationalNumber(r.numerator,r.denominator).numerator
denominator(r::RationalNumber) = RationalNumber(r.numerator,r.denominator).denominator

#show(io::IO, r::RationalNumber) = print(io,"\"" * @sprintf("a//b"))