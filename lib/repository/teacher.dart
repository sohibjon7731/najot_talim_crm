// Alt Shif F - formatter
// Alt Shif L - formatter for JetBrains

import '../models/teacher.dart';

/// Interface
abstract class TeacherRepository {
  List<Teacher> teachers = [];

  factory TeacherRepository() => TeacherRepositoryImpl();

  Teacher createTeacher({
    required String id,
    required String firstName,
    required String lastName,
    required String password,
    required bool isMale,
    required String subject,
    required int salary,
  });

  bool deleteTeacher(String id);

  bool updateTeacher(String id, Teacher teacher);

  Teacher fetchTeacher(String id, String password);

  List<Teacher> fetchTeachers();
}

class TeacherRepositoryImpl implements TeacherRepository {
  @override
  List<Teacher> teachers = [];

  @override
  Teacher createTeacher({
    required String id,
    required String firstName,
    required String lastName,
    required String password,
    required bool isMale,
    required String subject,
    required int salary,
  }) {
    var newTeacher = Teacher(
      id: id,
      firstName: firstName,
      lastName: lastName,
      password: password,
      isMale: isMale,
      salary: salary,
      subject: subject,
    );

    teachers.add(newTeacher);

    return newTeacher;
  }

  @override
  bool deleteTeacher(String id) {
    late bool isDeleted = false;

    try {
      for (Teacher teacher in teachers) {
        if (teacher.id == id) {
          teachers.remove(teacher);
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
  Teacher fetchTeacher(String id, String password) {
    var searchedTeacher = teachers.firstWhere(
        (element) => element.id == id && element.password == password);
    return searchedTeacher;
  }

  @override
  List<Teacher> fetchTeachers() {
    return teachers;
  }

  @override
  bool updateTeacher(String id, Teacher teacher) {
    // TODO: implement updateTeacher
    throw UnimplementedError();
  }
}
