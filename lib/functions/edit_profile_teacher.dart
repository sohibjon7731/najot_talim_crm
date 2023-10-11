import 'package:nt_crm/conts/constants.dart';
import 'package:nt_crm/functions/clear_terminal.dart';
import 'package:nt_crm/functions/validator.dart';
import 'package:nt_crm/app.dart';
import 'package:nt_crm/models/teacher.dart';

Teacher editProfileTeacher() {
  bool isTerminated = false;
  final int index =
      teacherRepository.teachers.indexOf(authenticatedUser! as Teacher);
  do {
    clearTerminal();
    print(AppConstans.editProfileTextTeacher);

    var input = validator("Buyruq");

    final int task = int.tryParse(input) ?? -1;

    if (task >= 0 || task < 8) {
      switch (task) {
        case 0:
          isTerminated = true;
          break;
        case 1:
          final subject = validator("Subject");
          authenticatedUser =
              (authenticatedUser! as Teacher).copyWith(subject: subject);
          break;
        case 2:
          final email = validator("Email");
          authenticatedUser =
              (authenticatedUser! as Teacher).copyWith(email: email);
          break;
        case 3:
          final salary = validator("Salary");
          int? salaryInt = int.tryParse(salary);
          authenticatedUser =
              (authenticatedUser! as Teacher).copyWith(salary: salaryInt);
          break;
        case 4:
          final firstname = validator("FirstName");
          authenticatedUser =
              (authenticatedUser! as Teacher).copyWith(firstName: firstname);
          break;
        case 5:
          final lastname = validator("LastName");
          authenticatedUser =
              (authenticatedUser! as Teacher).copyWith(lastName: lastname);
          break;
        case 6:
          final isMale = validator("IsMale");
          bool? isMaleBool = bool.tryParse(isMale);
          authenticatedUser =
              (authenticatedUser! as Teacher).copyWith(isMale: isMaleBool);
          break;
        case 7:
          final password = validator("Password");
          authenticatedUser =
              (authenticatedUser! as Teacher).copyWith(password: password);
          break;
      }
    } else {
      print("Noto'g'ri buyruq kiritdingiz! Iltimos, qayta urinib ko'ring");
    }
  } while (!isTerminated);

  teacherRepository.teachers[index] = authenticatedUser! as Teacher;
  return authenticatedUser as Teacher;
}
