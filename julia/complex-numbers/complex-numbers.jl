import Base:+,-,*,/,≈,==,exp, sqrt,show
struct ComplexNumber <: Number
    real::Float64
    imaginary::Float64
end
+(a::Number, b::ComplexNumber) = b + a
+(a::ComplexNumber, b::Number)  = ComplexNumber(a.real + b, a.imaginary)
+(a::ComplexNumber,b::ComplexNumber) =  ComplexNumber(a.real + b.real,a.imaginary + b.imaginary)
-(a::ComplexNumber,b::ComplexNumber) =  ComplexNumber(a.real  - b.real,a.imaginary - b.imaginary)
*(a::Number,b::ComplexNumber) =  b * a
*(a::ComplexNumber,b::Number) =  ComplexNumber(a.real * b,a.imaginary * b)
*(a::ComplexNumber,b::ComplexNumber) =  ComplexNumber(a.real * b.real  - a.imaginary * b.imaginary,a.real*b.imaginary + a.imaginary * b.real)
conj(n::ComplexNumber) = ComplexNumber(n.real,n.imaginary  == 0 ? 0 : -n.imaginary)
≈(a::ComplexNumber,b::ComplexNumber) =  isapprox(a.real,b.real,atol=1e-6)  && isapprox(a.imaginary,b.imaginary,atol=1e-6)
==(a::ComplexNumber,b::ComplexNumber) = a.real == b.real && a.imaginary == b.imaginary 
/(a::ComplexNumber,b::Number) =  ComplexNumber(a.real/b, a.imaginary/b)
/(a::ComplexNumber,b::ComplexNumber) =  conj(b) * a / (conj(b) * b).real
abs(n::ComplexNumber) = sqrt(n.real^2+n.imaginary^2)
real(n::ComplexNumber) =  n.real
imag(n::ComplexNumber) = n.imaginary
exp(n::ComplexNumber) = ComplexNumber(exp(n.real) * cos(n.imaginary), exp(n.real) * sin(n.imaginary))
#define jm
jm = ComplexNumber(0,1)