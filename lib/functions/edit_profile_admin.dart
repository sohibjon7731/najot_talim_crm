import 'package:nt_crm/conts/constants.dart';
import 'package:nt_crm/functions/clear_terminal.dart';
import 'package:nt_crm/functions/validator.dart';
import 'package:nt_crm/models/admin.dart';
import 'package:nt_crm/app.dart';

Admin editProfileAdmin() {
  bool isTerminated = false;
  final int index = adminRepository.admins.indexOf(authenticatedUser! as Admin);
  do {
    clearTerminal();
    print(AppConstans.editProfileTextAdmin);

    var input = validator("Buyruq");

    final int task = int.tryParse(input) ?? -1;

    if (task >= 0 || task < 5) {
      switch (task) {
        case 0:
          isTerminated = true;
          break;
        case 1:
          final firstName = validator("Ism");
          authenticatedUser =
              (authenticatedUser! as Admin).copyWith(firstName: firstName);
          break;
        case 2:
          final lastName = validator("Familiya");
          authenticatedUser =
              (authenticatedUser! as Admin).copyWith(lastName: lastName);
          break;
        case 3:
          final password = validator("Parol");
          authenticatedUser =
              (authenticatedUser! as Admin).copyWith(password: password);
          break;
        case 4:
          final email = validator("Email");
          authenticatedUser =
              (authenticatedUser! as Admin).copyWith(email: email);
          break;
      }
    } else {
      print("Noto'g'ri buyruq kiritdingiz! Iltimos, qayta urinib ko'ring");
    }
  } while (!isTerminated);

  adminRepository.admins[index] = authenticatedUser! as Admin;
  return authenticatedUser as Admin;
}
