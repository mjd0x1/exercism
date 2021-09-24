function triangle1(n)
    if n == 0 return [] end
    if n < 0 throw(DomainError("Require positive n")) end
    a = [[1]]
    allrows = [[1]]
    for i = 2:n
        a = [1,map(x -> sum(a[x:x + 1]), 1:length(a) - 1)...,1]
        push!(allrows, a)
    end
    allrows
end

"pascals triangle final iteration"
function triangle(n)
    if n == 0 return [] end
    if n < 0 throw(DomainError("Require positive n")) end
    a = [[1]]
    allrows = fill([1], n)
   
    for i = 2:n
        a = [1,a[2:end] .+ a[1:end - 1]...,1]
        allrows[i] = a
    end
    allrows
end



