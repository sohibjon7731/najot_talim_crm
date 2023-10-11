import 'package:nt_crm/conts/constants.dart';
import 'package:nt_crm/functions/clear_terminal.dart';
import 'package:nt_crm/functions/validator.dart';
import 'package:nt_crm/models/student.dart';
import 'package:nt_crm/app.dart';

Student editProfileStudent() {
  bool isTerminated = false;
  final int index = repository.students.indexOf(authenticatedUser! as Student);
  do {
    clearTerminal();
    print(AppConstans.editProfileTextStudent);

    var input = validator("Buyruq");

    final int task = int.tryParse(input) ?? -1;

    if (task >= 0 || task < 6) {
      switch (task) {
        case 0:
          isTerminated = true;
          break;
        case 1:
          final firstName = validator("Ism");
          authenticatedUser = (authenticatedUser! as Student).copyWith(firstName: firstName);
          break;
        case 2:
          final lastName = validator("Familiya");
          authenticatedUser = (authenticatedUser! as Student).copyWith(lastName: lastName);
          break;
        case 3:
          final password = validator("Parol");
          authenticatedUser = (authenticatedUser! as Student).copyWith(password: password);
          break;
        case 4:
          final email = validator("Email");
          authenticatedUser = (authenticatedUser! as Student).copyWith(email: email);
          break;
        case 5:
          final course = validator("Kurs");
          authenticatedUser = (authenticatedUser! as Student).copyWith(course: course);
          break;
      }
    } else {
      print("Noto'g'ri buyruq kiritdingiz! Iltimos, qayta urinib ko'ring");
    }
  } while (!isTerminated);
  
  repository.students[index] = authenticatedUser! as Student;
  return authenticatedUser as Student;
}
