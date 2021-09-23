isisogram(s) =  begin
    new_s = split(s, r"[^A-Za-z]") |> join
    length((∩(lowercase(new_s)))) == length(new_s)
end 
