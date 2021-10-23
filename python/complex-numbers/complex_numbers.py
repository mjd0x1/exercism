from math import exp,cos,sin

class ComplexNumber:
    def __init__(self, real, imaginary):
        self.real  = real
        self.imaginary = imaginary

    def __eq__(self, other):
        return self.real == other.real and self.imaginary == other.imaginary

    def __add__(self, other):
         if type(other) == ComplexNumber:
            return ComplexNumber(self.real+other.real,self.imaginary+other.imaginary)
         else:
            return ComplexNumber(self.real+other,self.imaginary)

    def __mul__(self, other):
        if type(other) == ComplexNumber:
            return ComplexNumber(self.real*other.real-self.imaginary*other.imaginary,self.imaginary*other.real+self.real*other.imaginary)
        else:
            return ComplexNumber(self.real*other,self.imaginary*other)
        
    def __sub__(self, other):
        if type(other) == ComplexNumber:
            return ComplexNumber(self.real-other.real,self.imaginary-other.imaginary)
        else:
             return ComplexNumber(self.real-other,self.imaginary)

    def __float__(self):
         return float(self.real)

    def __repr__(self):
        return str(self.real) + ("+" if self.imaginary >= 0 else "") + str(self.imaginary)+"i"

    def __truediv__(self, other):
        
        if type(other) == ComplexNumber:
            denominator = float(other.conjugate() * other)
            numerator = other.conjugate() * self
            return ComplexNumber(numerator.real/denominator,numerator.imaginary/denominator) 
        else:
             return ComplexNumber(self.real/other,self.imaginary/other) 

    def __abs__(self):
        return (self.real**2+ self.imaginary**2)**0.5

    def conjugate(self):
        return ComplexNumber(self.real,-self.imaginary)

    def exp(self):
        return ComplexNumber(exp(self.real) *cos(self.imaginary),exp(self.real)  * sin(self.imaginary))
