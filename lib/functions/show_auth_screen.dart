import 'dart:io';

import 'package:nt_crm/functions/login.dart';

import 'package:nt_crm/functions/sign_up.dart';

import 'package:nt_crm/functions/terminate_app.dart';

import 'package:nt_crm/app.dart';

void showAuthScreen() {
  String? input = stdin.readLineSync();

  if (input == null) {
    print("Siz hech qanday buyruq kiritmadingiz!");
  } else {
    // Yaroqsiz qiymat kiritish
    var parsedInput = int.tryParse(input);

    if (parsedInput == null) {
      print("Siz yaroqsiz qiymat kiritdingiz!");
    } else {
      /* clearTerminal(); */
      if (parsedInput <= 3 && parsedInput >= 0) {
        switch (parsedInput) {
          case 0:
            isTerminated = terminateApp();
            break;
          case 1:
            signUp();
            break;
          case 2:
            login();
            break;
          case 3:
            var teachers = teacherRepository.fetchTeachers();
            for (final teacher in teachers) {
              print(teacher);
            }
            var students = repository.fetchStudents();
            for (final student in students) {
              print(student);
            }
            var admins = adminRepository.fetchAdmins();
            for (final admin in admins) {
              print(admin);
            }
/*             stdin.readLineSync();
 */
            break;
          default:
        }
      } else {
        print("Siz kiritgan buyruq mavjud emas!");
      }
    }
  }
}
