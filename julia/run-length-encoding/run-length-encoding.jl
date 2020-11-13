function encode(s)
    current = s[1]
    count =1
    output = ""

    for i=2:length(s)
        if s[i]==current
            count+=1 
        else
            output *= string(count) * current
            current = s[i]
            count= 1
        end
    end
    output *= string(count) * current

end



function decode(s)
    output = ""
    for i=1:length(s)
        if isnumeric(s[i])  
            output *= s[i+1] ^ parse(Int,s[i])
        end
    end
    output
end
