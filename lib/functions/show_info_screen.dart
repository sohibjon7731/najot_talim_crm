import 'dart:io';

import 'package:nt_crm/functions/edit_profile_admin.dart';
import 'package:nt_crm/functions/edit_profile_student.dart';
import 'package:nt_crm/functions/edit_profile_teacher.dart';
import 'package:nt_crm/functions/sign_up_as_student.dart';
import 'package:nt_crm/functions/sign_up_as_teacher.dart';

import 'package:nt_crm/functions/terminate_app.dart';
import 'package:nt_crm/app.dart';
import 'package:nt_crm/functions/validator.dart';
import 'package:nt_crm/models/admin.dart';
import 'package:nt_crm/models/student.dart';
import 'package:nt_crm/models/teacher.dart';

void showInfoScreen() {
  if (authenticatedUser is Admin) {
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
        if (parsedInput <= 9 && parsedInput >= 1) {
          switch (parsedInput) {
            case 1:
              // TODO 4: fix
              print(teacherRepository.teachers);

              break;
            case 2:
              print(repository.students);
              // TODO 4: fix
              break;
            case 3:
              signUpAsTeacher();
              //add teacher
              break;
            case 4:
              signUpAsStudent();
              //add student
              break;

            case 5:
              var id = validator("id");
              var deletedTeacher = teacherRepository.deleteTeacher(id);
              if (deletedTeacher) {
                print("Idisi $id bo'lgan teacher o'chirildi");
              } else {
                print(
                    "Nmadir xato ketdi. Bunday (id)yo'q ko'rinadi. TRY AGAIN");
              }
              break;
            case 6:
              var id = validator("id");
              var deletedStudent = repository.deleteStudent(id);
              if (deletedStudent) {
                print("Idisi $id bo'lgan student o'chirildi");
              } else {
                print(
                    "Nmadir xato ketdi. Bunday (id)yo'q ko'rinadi. TRY AGAIN");
              }
              break;
            case 7:
              if (authenticatedUser is Admin) {
                if (adminRepository.admins.isEmpty) {
                  print("Bunday foydalanuvchi topilmadi");
                } else {
                  authenticatedUser = editProfileAdmin();
                }
              }
              //edit adminstrator
              break;
            case 8:
              // TODO 4: fix
              authenticatedUser = null;
              break;
            case 9:
              isTerminated = terminateApp();
              break;
            default:
          }
        } else {
          print("Siz kiritgan buyruq mavjud emas!");
        }
      }
    }
  } else if (authenticatedUser is Teacher || authenticatedUser is Student) {
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
                if (repository.students.isEmpty) {
                  print("Bunday foydalanuvchi topilmadi");
                } else {
                  authenticatedUser = editProfileStudent();
                }
              } else {
                if (teacherRepository.teachers.isEmpty) {
                  print("Bunday foydalanuvchi topilmadi");
                } else {
                  authenticatedUser = editProfileTeacher();
                }
              }
              break;
            case 3:
              if (authenticatedUser is Student) {
                repository.students.remove(authenticatedUser);
              } else if (authenticatedUser is Teacher) {
                teacherRepository.teachers.remove(authenticatedUser);
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
}
