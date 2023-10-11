import '../models/student.dart';

// Alt Shif F - formatter
// Alt Shif L - formatter for JetBrains

/// Interface
abstract class StudentRepository {
  List<Student> students = [];

  factory StudentRepository() => StudentRepositoryImpl();

  Student createStudent({
    required String id,
    required String firstName,
    required String lastName,
    required String password,
    required bool isMale,
    required String course,
  });

  bool deleteStudent(String id);

  bool updateStudent(String id, Student student);

  Student fetchStudent(String id, String password);

  List<Student> fetchStudents();
}

class StudentRepositoryImpl implements StudentRepository {
  @override
  List<Student> students = [];

  @override
  Student createStudent({
    required String id,
    required String firstName,
    required String lastName,
    required String password,
    required bool isMale,
    required String course,
  }) {
    var newStudent = Student(
      id: id,
      firstName: firstName,
      lastName: lastName,
      password: password,
      isMale: isMale,
      course: course,
    );

    students.add(newStudent);

    return newStudent;
  }

  @override
  bool deleteStudent(String id) {
    late bool isDeleted = false;

    try {
      for (Student student in students) {
        if (student.id == id) {
          students.remove(student);
          isDeleted = true;
          break; // Exit the loop when the student is found
        }
      }
    } catch (e) {
      isDeleted = false;
      // Handle the exception here
      print("An error occurred: $e");
    }

    return isDeleted;
  }

  @override
  Student fetchStudent(String id, String password) {
    var searchedStudent = students.firstWhere(
        (element) => element.id == id && element.password == password);
    return searchedStudent;
  }

  @override
  List<Student> fetchStudents() {
    return students;
  }

  @override
  bool updateStudent(String id, Student student) {
    // TODO: implement updateStudent
    throw UnimplementedError();
  }
}
