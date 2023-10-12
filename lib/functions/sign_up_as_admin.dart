import 'package:nt_crm/functions/select_gender.dart';
import 'package:nt_crm/functions/validator.dart';
import 'package:nt_crm/models/admin.dart';
import 'package:nt_crm/app.dart';

Admin signUpAsAdmin() {
  late bool isMale;
  var id = validator("ID");
  var firstName = validator("Ism");
  var lastName = validator("Familiya");
  var password = validator("Parol");
  isMale = selectGender();

  return adminRepository.createAdmin(
    isMale: isMale,
    firstName: firstName,
    id: id,
    lastName: lastName,
    password: password,
  );
}
