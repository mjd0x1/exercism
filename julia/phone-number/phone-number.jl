valid_digits =  n -> n[1] > '1' && n[4] > '2'
country_code =  n -> first(n) == '1'

function clean(phone_number)    
    numbers = [x.match for x in eachmatch(r"[0-9]+", phone_number)] |> join
    if length(numbers) == 10 &&  valid_digits(numbers) return numbers end
    if length(numbers) > 10 && country_code(numbers) && valid_digits(numbers[2:end]) return numbers[2:end] end
    throw(ArgumentError("Invalid numnbers"))
end
