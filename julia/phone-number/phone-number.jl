function clean(phone_number)
    validDigits =  n -> n[1] > '1' && n[4] > '2'
    countryCode =  n -> n[1]=='1'
    numbers = filter(x-> 48 <= Int(x) <= 57,collect(phone_number)) |> join
    if length(numbers) == 10 &&  validDigits(numbers) return numbers end
    if length(numbers) > 10 && countryCode(numbers) && validDigits(numbers[2:end]) return numbers[2:end] end
    nothing
end
