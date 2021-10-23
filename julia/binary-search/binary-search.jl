function binarysearch(data, value)
    sort!(data)
    bs(data, value, 1, length(data))
end


function bs(data, value, l, r)

    k  = div(l + r, 2)
    if data[k] == value 
        return l:r 
    else
        bs(data, value, value < data[k] ? 1 : k,  value < data[k] ? k : r)
    end

end