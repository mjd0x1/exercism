import collections


def is_isogram(string):
    letters = filter(lambda x: str.isalpha(x), string)
    c = collections.Counter(''.join(letters).lower())
    return max(c.values(), default=1) == 1
