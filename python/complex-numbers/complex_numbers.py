from math import exp, cos, sin
import numbers


class ComplexNumber:
    def __init__(self, real, imaginary):
        self.real = real
        self.imaginary = imaginary

    def __eq__(self, other):
        return self.real == other.real and self.imaginary == other.imaginary

    def __add__(self, other):
        if isinstance(other, ComplexNumber):
            return ComplexNumber(
                self.real + other.real, self.imaginary + other.imaginary
            )
        elif isinstance(other, numbers.Real):
            return ComplexNumber(self.real + other, self.imaginary)
        else:
            raise TypeError("Type not defined")

    def __mul__(self, other):
        if isinstance(other, ComplexNumber):
            return ComplexNumber(
                self.real * other.real - self.imaginary * other.imaginary,
                self.imaginary * other.real + self.real * other.imaginary,
            )
        elif isinstance(other, numbers.Real):
            return ComplexNumber(self.real * other, self.imaginary * other)
        else:
            raise TypeError("Type not defined")

    def __radd__(self, other):
        if isinstance(other, numbers.Real):
            return ComplexNumber(self.real + other, self.imaginary)
        else:
            raise TypeError("Type not defined")

    def __rmul__(self, other):
        if isinstance(other, numbers.Real):
            return ComplexNumber(self.real * other, self.imaginary * other)
        else:
            raise TypeError("Type not defined")

    def __sub__(self, other):
        if isinstance(other, ComplexNumber):
            return ComplexNumber(
                self.real - other.real, self.imaginary - other.imaginary
            )
        elif isinstance(other, numbers.Real):
            return ComplexNumber(self.real - other, self.imaginary)
        else:
            raise TypeError("Type not defined")

    def __float__(self):
        return float(self.real)

    def __repr__(self):
        return f"{self.real} + {self.imaginary}i"

    def __truediv__(self, other):
        if isinstance(other, ComplexNumber):
            denominator = float(other.conjugate() * other)
            numerator = other.conjugate() * self
            return ComplexNumber(
                numerator.real / denominator, numerator.imaginary / denominator
            )
        elif isinstance(other, numbers.Real):
            return ComplexNumber(self.real / other, self.imaginary / other)
        else:
            raise TypeError("Type not defined")

    def __abs__(self):
        return (self.real ** 2 + self.imaginary ** 2) ** 0.5

    def conjugate(self):
        return ComplexNumber(self.real, -self.imaginary)

    def exp(self):
        return ComplexNumber(
            exp(self.real) * cos(self.imaginary),
            exp(self.real) * sin(self.imaginary),
        )
