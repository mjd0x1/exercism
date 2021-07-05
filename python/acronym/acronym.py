import re


def abbreviate(words):
    adjust = words.upper().replace("_", "")
    return "".join(map(lambda x: x[0], re.findall(r"\w+'*\w*", adjust)))
