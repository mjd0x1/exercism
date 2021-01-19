

function raindrops(number)
   
   raindrops = [(3,"Pling"),(5,"Plang"),(7,"Plong")]
   result  = map(x-> number % x[1] == 0 ? x[2] : "" ,raindrops) |> join
   result == "" ? string(number) : result
    
end
