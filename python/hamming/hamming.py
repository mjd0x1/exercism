def distance(strand_a, strand_b):
    if len(strand_a) != len(strand_b):
        raise ValueError("strands must be the same length.")

    return sum([(lambda x, y:  1 if x != y else 0)(x, y) for (x, y) in zip(
                    strand_a, strand_b)])
