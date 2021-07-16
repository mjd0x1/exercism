class Garden:
    def __init__(self, diagram, students=None):

        STUDENTS_LIST = [
                         "Alice", "Bob", "Charlie", "David",
                         "Eve", "Fred", "Ginny", "Harriet",
                         "Ileana", "Joseph", "Kincaid", "Larry"
                         ]
        if students is None:
            self.students = STUDENTS_LIST
        else:
            self.students = sorted(students)

        self.rows = [list(x) for x in diagram.split('\n')]
        self.plants_dict = {
                            "C": "Clover", "G": "Grass",
                            "R": "Radishes", "V": "Violets"
                            }

    def plants(self, student_name):
        id = self.students.index(student_name) * 2
        all_letters = self.rows[0][id:id+2] + self.rows[1][id:id+2]
        return list(map(lambda x: self.plants_dict[x], all_letters))
