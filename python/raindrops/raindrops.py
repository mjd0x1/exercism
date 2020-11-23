def convert(number):
    d = {3: "Pling", 5: "Plang", 7: "Plong"}
    output = "".join(map(lambda n:  d[n] if number % n == 0 else "", d.keys()))
    return str(number) if output == "" else output
