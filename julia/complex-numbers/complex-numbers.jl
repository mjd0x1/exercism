using LinearAlgebra
import Base:+,-,*,/,≈,==,exp, sqrt,show

struct ComplexNumber <: Number
    real::Number
    imaginary::Number
    matrix::Matrix{Number}
    
    ComplexNumber(real::Number,imaginary::Number) = begin 
        matrix = [real -imaginary ; imaginary real]
        new(real,imaginary,matrix)
    end
    ComplexNumber(m::Matrix{Number}) = begin
        real,imaginary,_,_ = m
        new(real,imaginary,m)
    end
    ComplexNumber((real,imaginary)) = ComplexNumber(real,imaginary)
    ComplexNumber(real::Number) = ComplexNumber(real,0)

end

+(a::ComplexNumber, b::ComplexNumber)  = ComplexNumber(a.matrix .+ b.matrix)
+(a::ComplexNumber, b::Number)  = ComplexNumber(I(2)*b .+ a.matrix)
#+(a::Number,b::ComplexNumber)  = ComplexNumber(b.matrix .+ I(2)*a)
-(a::ComplexNumber,b::ComplexNumber) = ComplexNumber(a.matrix .- b.matrix)
*(a::ComplexNumber,b::Number) = ComplexNumber(a.matrix * b)
*(a::Number,b::ComplexNumber) = ComplexNumber(b.matrix * a)
*(a::ComplexNumber,b::ComplexNumber) = ComplexNumber(a.matrix * [b.real ; b.imaginary])
/(a::ComplexNumber,b::ComplexNumber) = ComplexNumber(a.matrix * inv(b.matrix))
conj(n::ComplexNumber) = ComplexNumber(n.real,n.imaginary  == 0 ? 0 : -n.imaginary)
≈(a::ComplexNumber,b::ComplexNumber) =  isapprox(a.real,b.real,atol=1e-6)  && isapprox(a.imaginary,b.imaginary,atol=1e-6)
==(a::ComplexNumber,b::ComplexNumber) = a.matrix == b.matrix


/(a::ComplexNumber,b::Number) =  ComplexNumber(a.real/b, a.imaginary/b)


abs(n::ComplexNumber) = sqrt(n.real^2+n.imaginary^2)
real(n::ComplexNumber) =  n.real
imag(n::ComplexNumber) = n.imaginary

exp(n::ComplexNumber) = ComplexNumber(exp(n.real) * cos(n.imaginary), exp(n.real) * sin(n.imaginary))

#define jm
jm = ComplexNumber(0,1)
