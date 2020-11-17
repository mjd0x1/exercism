"""
    ispangram(input)

Return `true` if `input` contains every alphabetic character (case insensitive).

"""
ispangram(input)  =length(uppercase.(collect('a':'z'))  ∩  uppercase.(input)) == 26 

