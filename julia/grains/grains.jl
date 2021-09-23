
"""Helper Calculate function with checks. """
calculate(square,calc) =  if 0 < square < 65 calc(big(square)) else throw(DomainError("invalid square")) end

"""Calculate the number of grains on square `square`."""
on_square(square) =  calculate(square, square ->  2^(square - 1))

"""Calculate the total number of grains after square `square`."""
total_after(square)  =  calculate(square,  square -> 2^square - 1)
