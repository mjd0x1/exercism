function annotate(minefield)
    output = copy(minefield)
    for i = 1:length(minefield)
        output[i] = join([minefield[i][j] != '*' ? get_stars(i, j, minefield) : "*" for j = 1:length(minefield[1])])
    end
    output
end

function get_stars(pos_x, pos_y, minefield) 
    r, c =  length(minefield), length(minefield[1])
    positions = [(0, 1),(0, -1),(1, 0),(1, 1),(1, -1),(-1, 0),(-1, 1),(-1, -1)]
    result  = map(x -> r >=  pos_x + first(x) > 0 && c >=  pos_y + last(x) > 0 ?  minefield[pos_x + first(x)][pos_y + last(x)] == '*' : false, positions) |> sum
    result > 0 ? string(result) : " "
end

