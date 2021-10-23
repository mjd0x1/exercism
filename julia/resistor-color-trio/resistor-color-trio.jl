const color_labels = Dict("black" =>  0, "brown" => 1, "red" => 2, "orange" => 3, "yellow" => 4, "green" => 5, "blue" =>  6, "violet" => 7, "grey" => 8, "white" => 9)

function label(colors)
    (first, second, zeros) = map(x -> color_labels[x], colors)
    number = (first * 10 + second) * 10^zeros
    mod(number, 1000) == 0 ?  string(div(number, 1000)) * " kiloohms" : string(number) * " ohms"
end

