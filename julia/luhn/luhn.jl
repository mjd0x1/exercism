function luhn(number)
    allchars  = (m.match for m in eachmatch(r"[^\s]", number)) |> join
    numbers = (parse(Int, m.match) for m in eachmatch(r"\d", number)) |> collect |> reverse
    
    even = (x -> x > 9 ? x - 9 : x).(numbers[2:2:end] .* 2)
    odd  = numbers[1:2:end]
    
    mod(sum(odd)  + sum(even), 10) == 0 && length(numbers) > 1 && length(allchars) == length(numbers)
end