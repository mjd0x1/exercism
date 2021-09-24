using Primes

"function to perform prime factorisation,  uses Primes"
prime_factors2(number)  = factor(Vector, number)

"function to perform prime factorisation,  naive tail recursion, stack overflow"
function prime_factors3(number)
    prime_factors_recursion(2, number, [])
end

"function to perform prime factorisation,  naive while"
function prime_factors(number)
    prime_factors_while(number)
end

function prime_factors_recursion(i, number, factors)
    if number == 1
        return factors
    else
        check = mod(number, i) == 0
        prime_factors_recursion(check  ? i : i + 1, check ?  div(number, i) : number, check ? [factor
                                                                                              i] : factors)
    end

end

function prime_factors_while(number)
    
    factors = []
    n  = 2

    while number > 1
        if mod(number, n) == 0 
            number = div(number, n)
            factors  = [factors
                        n] 
        else n += 1
    end
    end
    factors

end