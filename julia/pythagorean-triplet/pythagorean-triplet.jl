function pythagorean_triplets(n)
    linear_search(n)
    # brute_force(n)
end

# factorise and simplify g(x,y,n)
# g(x,y,n) = x^2 + y^2 - (n - x - y)^2 
# = (x+y)^2 - 2xy - (n - (x+y))^2
g(x,y,n) = n^2  - 2 * n * (x + y) + 2 * x * y 

# solve for y
f(n,x) = (n^2 - 2 * n * x) ÷ (2 * (n - x)) 

"linear search using formulae above"
function linear_search(n)
    solutions = []
    for x in 2:n - 1
        y = f(n, x)
        z = n - x - f(n, x)
        if g(x, y, n) == 0 && x < y
            push!(solutions, (x, y, z))
        end
    end
    solutions
        
end
# 142.064 μs (8 allocations: 368 bytes)


g(x,y,n) = x^2 + y^2 - (n - x - y)^2 

"brute force"
function brute_force(n)
    solutions = []
    for x in 1:n, y in 1:n
        if g(x, y, n) == 0 && x < y < n - x - y
            push!(solutions, (x, y, n - x - y))
        end
    end
    solutions
    end


