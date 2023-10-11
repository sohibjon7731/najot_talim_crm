import 'dart:io';

import 'package:nt_crm/functions/edit_profile_student.dart';
import 'package:nt_crm/functions/edit_profile_teacher.dart';

import 'package:nt_crm/functions/terminate_app.dart';
import 'package:nt_crm/app.dart';
import 'package:nt_crm/functions/validator.dart';
import 'package:nt_crm/models/student.dart';

void showInfoScreen() {
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
      if (parsedInput <= 5 && parsedInput >= 1) {
        switch (parsedInput) {
          case 1:
            // TODO 4: fix
            if (authenticatedUser is Student) {
              print(repository.students);
            } else {
              print(teacherRepository.teachers);
            }
            /* print(authenticatedUser);
            stdin.readLineSync(); */
            break;
          case 2:
            // TODO 4: fix
            if (authenticatedUser is Student) {
              authenticatedUser = editProfileStudent();
            } else {
              authenticatedUser = editProfileTeacher();
            }
            break;
          case 3:
            if (authenticatedUser is Student) {
              var id = validator("id");
              var deletedStudent = repository.deleteStudent(id);
              if (deletedStudent) {
                print("Idisi $id bo'lgan student o'chirildi");
              } else {
                print(
                    "Nmadir xato ketdi. Bunday (id)yo'q ko'rinadi. TRY AGAIN");
              }
            } else {
              var id = validator("id");
              var deletedTeacher = teacherRepository.deleteTeacher(id);
              if (deletedTeacher) {
                print("Idisi $id bo'lgan teacher o'chirildi");
              } else {
                print(
                    "Nmadir xato ketdi. Bunday (id)yo'q ko'rinadi. TRY AGAIN");
              }
            }
            break;
          case 4:
            // TODO 4: fix
            authenticatedUser = null;
            break;
          case 5:
            isTerminated = terminateApp();
            break;
          default:
        }
      } else {
        print("Siz kiritgan buyruq mavjud emas!");
      }
    }
  }
}
