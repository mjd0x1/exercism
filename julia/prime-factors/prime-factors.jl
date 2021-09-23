# using Primes

"function to perform prime factorisation"
function prime_factors(number)
    # factor(Vector, number)
    my_prime_factors(number)
    # my_prime_factors2(2, number, [])
end

function my_prime_factors2(i, number, factors)
    if number == 1
        return factors
    else
        check = mod(number, i) == 0
        my_prime_factors2(check  ? i : i + 1, check ?  div(number, i) : number, check ? [factors...,i] : factors)
    end

end

function my_prime_factors(number)
    
    factors = []
    n  = 2

    while number > 1
        if mod(number, n) == 0 
            number = div(number, n)
            factors  = [factors...,n] 
        else n += 1
        end
    end
    factors

end