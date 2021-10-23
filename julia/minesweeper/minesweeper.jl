function annotate(minefield)
    if minefield == [] return [] end
    a =  hcat(split.(minefield, "")...) .== "*"
    rows = length(minefield)
    cols =  length(minefield[1])
    output = fill(0, ((rows, cols)))
    for r in 1:rows,c in 1:cols
        output[r,c] = sum([r + 1 <= rows ? a[r + 1,c] : 0,
                            r - 1 > 0 ? a[r - 1,c] : 0,
                            c + 1 <= cols ? a[c + 1,r] : 0,
                            c - 1 > 0 ? a[c - 1,r] : 0,
                            r + 1 <= rows && c + 1 <= cols ? a[r + 1,c + 1] : 0,
                            r + 1 <= rows && c - 1 > 0 ? a[r + 1,c - 1] : 0,
                            r - 1 > 0 && c + 1 <= cols ? a[r - 1,c + 1] : 0,
                            r - 1 > 0 && c - 1 > 0 ? a[r - 1,c - 1] : 0])
    end
   out1  = fill("", ((rows, cols)))
   for r in 1:rows,c in 1:cols
        out1[r,c] = a[r,c] == 1  ? "*" : output[r,c] == 0 ? " " : string(output[r,c])
   end
   [join(out1[x,1:cols]) for x in 1:rows]
end

