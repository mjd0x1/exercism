"calculate sieve of eratosthenes"
function sieve(limit)
    
    a = fill(true, limit)
    for i = 2:div(limit, 2)
        a[2i:i:end] .= 0
    end
    (1:limit)[a][2:end]
   
end
