groupmates = [
    {"name": "Александр", "surname": "Иванов", "exams": ["Информатика", "ЭЭиС", "Web"], "marks": [4, 3, 5]},
    {"name": "Иван", "surname": "Петров", "exams": ["История", "АиГ", "КТП"], "marks": [4, 4, 4]},
    {"name": "Кирилл", "surname": "Смирнов", "exams": ["Философия", "ИС", "КТП"], "marks": [5, 5, 5]},
    {"name": "Анна", "surname": "Соколова", "exams": ["Информатика", "ИС", "Web"], "marks": [5, 4, 5]},
    {"name": "Мария", "surname": "Кузнецова", "exams": ["История", "АиГ", "КТП"], "marks": [3, 4, 3]},
    {"name": "Дмитрий", "surname": "Попов", "exams": ["Философия", "ИС", "Web"], "marks": [4, 5, 4]},
    {"name": "Елена", "surname": "Волкова", "exams": ["Информатика", "АиГ", "КТП"], "marks": [3, 3, 4]},
]


def filter_students(students, average_mark):
    return [student for student in students
            if sum(student["marks"]) / len(student["marks"]) > average_mark]


def print_students(students):
    print("Имя".ljust(15), "Фамилия".ljust(15), "Экзамены".ljust(30), "Оценки")
    for student in students:
        print(student["name"].ljust(15), student["surname"].ljust(15),
              ", ".join(student["exams"]).ljust(30),
              ", ".join(str(mark) for mark in student["marks"]))


if __name__ == "__main__":
    average_mark = float(input("Введите средний балл: "))
    print_students(filter_students(groupmates, average_mark))
