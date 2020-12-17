class Matrix:
    def __init__(self, matrix_string):
        self.matrix_array  = list(map(lambda x: [int(i) for i in  x.split(' ')] , matrix_string.split('\n')))
    

    def matrix(self):
        return self.matrix_array

    def row(self, index):
        return self.matrix_array[index-1]

    def column(self, index):
        return [i[index-1] for i in self.matrix_array]
