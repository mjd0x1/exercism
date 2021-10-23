calc_aliquot =  n -> sum((1:(div(n, 2)))[mod.(n, 1:div(n, 2)) .== 0])
is_calc(n,f)  =  n > 0 ? f(calc_aliquot(n), n)  : throw(DomainError("Must be greater than zero"))

isperfect(n) = is_calc(n, ==)
isabundant(n) =  is_calc(n, >)
isdeficient(n) = is_calc(n, <)