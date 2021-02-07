function secret_handshake(code)
    data = ((1,"wink"),(2, "double blink"),(4 , "close your eyes"),(8, "jump"))
    words = reduce((acc,x) -> code & x[1] == x[1] ? push!(acc,x[2]) : acc ,init = [],data)
    transform  = code & 16 == 16 ? reverse : identity
    words |> transform
end
