transform(input::AbstractDict) =  merge([Dict(lowercase.(input[x]) .=> x) for x in keys(input)]...)


