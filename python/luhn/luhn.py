class Luhn:
    def __init__(self, card_num):
        digits = [int(i) if ord(i) in range(48, 58) else -1
                  for i in card_num.replace(" ", "")]

        digits.reverse()
        digits_double = [2*v if i % 2 > 0 else
                         v for (i, v) in enumerate(digits)]
        digits_ten = [i-9 if i > 9 else i for i in digits_double]
        self.validated_number = min(digits_ten) > -1 and len(digits) > 1 and \
            sum(digits_ten) % 10 == 0

    def valid(self):
        return self.validated_number