var groupmates = [
    {name: "Александр", surname: "Иванов", group: "БВТ1702", marks: [4, 3, 5]},
    {name: "Иван", surname: "Петров", group: "БСТ1702", marks: [4, 4, 4]},
    {name: "Кирилл", surname: "Смирнов", group: "БАП1801", marks: [5, 5, 5]},
    {name: "Анна", surname: "Соколова", group: "БВТ1702", marks: [5, 4, 5]},
    {name: "Мария", surname: "Кузнецова", group: "БСТ1702", marks: [3, 4, 3]},
    {name: "Дмитрий", surname: "Попов", group: "БАП1801", marks: [4, 5, 4]},
    {name: "Елена", surname: "Волкова", group: "БВТ1702", marks: [3, 3, 4]}
];

var rpad = function (str, length) {
    str = str.toString();
    while (str.length < length) {
        str += " ";
    }
    return str;
};

var printStudents = function (students) {
    console.log(rpad("Имя", 15), rpad("Фамилия", 15),
                rpad("Группа", 8), rpad("Оценки", 20));
    for (var i = 0; i < students.length; i++) {
        console.log(rpad(students[i].name, 15), rpad(students[i].surname, 15),
                    rpad(students[i].group, 8), rpad(students[i].marks, 20));
    }
    console.log("\n");
};

var filterByGroup = function (students, group) {
    return students.filter(function (student) {
        return student.group === group;
    });
};

var filterByAverage = function (students, average) {
    return students.filter(function (student) {
        var sum = 0;
        for (var i = 0; i < student.marks.length; i++) {
            sum += student.marks[i];
        }
        return student.marks.length > 0 && sum / student.marks.length > average;
    });
};

console.log(groupmates);
console.log("Все студенты");
printStudents(groupmates);

document.getElementById("group-filter").addEventListener("submit", function (event) {
    event.preventDefault();
    var group = document.getElementById("student-group").value.trim();
    console.log("Студенты группы " + group);
    printStudents(filterByGroup(groupmates, group));
});

document.getElementById("average-filter").addEventListener("submit", function (event) {
    event.preventDefault();
    var averageInput = document.getElementById("student-average").value;
    var average = Number(averageInput.trim().replace(",", "."));
    if (averageInput.trim() !== "" && Number.isFinite(average)) {
        console.log("Студенты со средним баллом выше " + average);
        printStudents(filterByAverage(groupmates, average));
    } else {
        console.log("Средний балл должен быть числом");
    }
});
