class Matrix:
    def __init__(self, matrix_string):
        self.matrix_string = matrix_string

    def parse_matrix(self):
        rows = self.matrix_string.split("\n")
        return [row.split(" ") for row in rows]

    def row(self, index):
        return [int(coord) for coord in self.parse_matrix()[index-1]]

    def column(self, index):
        transpose = [*map(list, zip(*self.parse_matrix()))]
        return [int(coord) for coord in transpose[index-1]]
