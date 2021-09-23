function sieve(limit)
   
    a = fill(true, limit)
    a[1] = false
    for i = 2:limit
        a[i:i:end] .= false
    end
    a
end
