import 'dart:io';

import 'package:nt_crm/functions/clear_terminal.dart';
import 'package:nt_crm/functions/validator.dart';
import 'package:nt_crm/app.dart';
import 'package:nt_crm/models/authenticated_user.dart';

void login() {
  bool isTerminated = true;

  do {
    clearTerminal();
    print("""
Kim sifatida kirishni istaysiz?
1. O'qituvchi
2. Talaba
3. Adminstrator
0. Orqaga
""");

    var input = validator("Buyruq");

    var command = int.tryParse(input) ?? -1;

    if (command == -1) {
      print("Siz yaroqsiz qiymat kiritding!");
    } else {
      if (command == 0) {
        isTerminated = true;
      } else if (command == 1 || command == 2 || command == 3) {
        authenticatedUser = loginAsUser(command);
      } else {
        print("Siz mavjud bo'lmagan buyruq kiritdingiz!");
      }
    }
  } while (!isTerminated);
}

AuthenticatedUser? loginAsUser(int command) {
  AuthenticatedUser? authenticatedUser;
  var id = validator("Id");
  var password = validator("Parol");

  try {
    if (command == 1) {
      authenticatedUser = teacherRepository.fetchTeacher(id, password);
    } else if (command == 2) {
      authenticatedUser = repository.fetchStudent(id, password);
    } else {
      authenticatedUser = adminRepository.fetchAdmin(id, password);
    }
  } catch (e) {
    print("Foydalanuvchi topilmadi");
    stdin.readLineSync();
  }

  return authenticatedUser;
}
