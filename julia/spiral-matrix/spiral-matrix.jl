"output spiral matrix"
function spiral_matrix(n)
    dx, dy = 0, 1
    px, py = 1, 1
    spiral = zeros((n, n))

    N = sequence_turns(n)
    ct = 1
    k = n
    for i = 1:n^2
        k -= (mod(i, 2) == 0)
        if ct == k
            dx, dy  = dy, -dx
            popfirst!(N)
            ct = 0
        end
        ct += 1
        
        spiral[px,py] = i 
        px, py = px + dx, py + dy
    end
    spiral
end


# 6# 5,5,5,4,4,3,3,2,2,1
#  # 1,6,11,16,20,24,27...
f(n) = fld(n, 2) + 1
"generate sequence of turns use formula"
sequence_turns(n)  = [n
                    f.((2(n - 1) - 1):-1:1)
                      1]
# 1.124 μs (3 allocations: 4.03 KiB)

"generate sequence of turns use formula cumulate"
sequence_turns2(n)  = cumsum([n - 1
                    f.((2(n - 1) - 1):-1:1)
                      1]) .+ 1
# 8.519 μs (5 allocations: 4.81 KiB)


"generate sequence of turns"
function sequence_turns_2(n)

    output = [n - 1,n - 1,n - 1]
    k  = n^2 - 3(n - 1)
    p = 2
    while n - p > 0 
    push!(output, n - p, n - p)
        k -= 2 * (n - p)
        p += 1
    end
    cumsum(output) .+ 1
        
    end
# 9.074 μs (8 allocations: 4.91 KiB)
