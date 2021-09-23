collatz_steps(n)  = begin 
    if n <= 0 return throw(DomainError("Must be positive")) end
    n == 1 ? 0 : 1 + collatz_steps(mod(n, 2) == 0 ? n / 2 : 3n + 1)
end
   