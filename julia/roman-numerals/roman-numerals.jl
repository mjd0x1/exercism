const divisors = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), 
                (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]

function to_roman(number)

    if number < 1 throw(ErrorException("Number must be greater than zero.")) end
    numeral_string, id = "", 1
    while id <= length(divisors)
        num, char  = divisors[id]
        if number ÷ num > 0     
            numeral_string *= repeat(char, number ÷ num)
            number %= num
        else
            id += 1
        end
    end
    numeral_string

end
    