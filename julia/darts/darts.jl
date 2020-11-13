function score(x, y)
    
    r =  (x^2 + y^2)^0.5
    if r > 10 return 0 end
    if 5  < r  <= 10 return 1 end
    if 1  < r   <= 5 return 5 end
    if 0  <= r  <= 1 return 10 end

end
