Map<String, int> students = {
  'Азамат': 85,
  'Айдана': 92,
  'Бекзат': 45,
  'Нурлан': 75,
  'Алина': 60,
};

void showStudents() {
  for (var name in students.keys) {
    print('$name - ${students[name]}');
  }
}

String getGradeStatus(int grade) {
  if (grade >= 90) {
    return 'Отлично';
  } else if (grade >= 70) {
    return 'Хорошо';
  } else if (grade >= 50) {
    return 'Удовлетворительно';
  } else {
    return 'Неудовлетворительно';
  }
}

double calculateAverage() {
  if (students.isEmpty) return 0;

  int sum = 0;

  for (var grade in students.values) {
    sum += grade;
  }

  return sum / students.length;
}

void findStudent(String name) {
  if (students.containsKey(name)) {
    print('$name - ${students[name]}');
  } else {
    print('Студент не найден');
  }
}

void addStudent(String name, int grade) {
  if (students.containsKey(name)) {
    print('Студент уже существует');
  } else if (grade < 0 || grade > 100) {
    print('Неправильная оценка');
  } else {
    students[name] = grade;
    print('Студент добавлен');
  }
}

void deleteStudent(String name) {
  students.remove(name);
  print('Студент удалён');
}

void bestStudent() {
  if (students.isEmpty) {
    print('Список пуст');
    return;
  }

  String best = '';
  int max = -1;

  for (var name in students.keys) {
    if (students[name]! > max) {
      max = students[name]!;
      best = name;
    }
  }

  print('$best - $max');
}

List<String> filterStudents() {
  List<String> result = [];

  for (var name in students.keys) {
    if (students[name]! >= 70) {
      result.add(name);
    }
  }

  return result;
}

void main() {
  print('ЭЛЕКТРОННЫЙ ЖУРНАЛ');

  showStudents();

  print('Средний балл: ${calculateAverage()}');

  print('Оценка 85: ${getGradeStatus(85)}');

  findStudent('Айдана');

  addStudent('Данияр', 80);

  deleteStudent('Бекзат');

  bestStudent();

  print('Студенты с оценкой от 70:');
  print(filterStudents());
}
