is_equilateral(sides) = valid_triangle(sides)  &&  unique_length(sides) == 1
is_isosceles(sides) = valid_triangle(sides)  && 1 <= unique_length(sides) <= 2
is_scalene(sides) = valid_triangle(sides)  && unique_length(sides) == 3

unique_length = length ∘ unique
valid_triangle((a, b, c)) = a + b > c && b + c > a && a + c > b