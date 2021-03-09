function secret_handshake(code)
    data = ("wink","double blink", "close your eyes", "jump")
    id = x -> 2^(x-1)
    words = [y for (x,y) in enumerate(data) if code & id(x)  == id(x)]
    code & 16 == 16 ? reverse!(words) : words
    
end
