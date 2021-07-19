class School:
    def __init__(self):
        self.roster_names = []

    def add_student(self, name, grade):
        self.roster_names.append({"name": name, "grade": grade})
        self.roster_names = sorted(self.roster_names,
                                   key=lambda x: str(x["grade"]) + x["name"])

    def roster(self):
        return list(map(lambda x: x["name"], self.roster_names))

    def grade(self, grade_number):
        filtered = filter(lambda x: x["grade"] ==
                          grade_number, self.roster_names)
        return list(map(lambda x: x["name"], filtered))
