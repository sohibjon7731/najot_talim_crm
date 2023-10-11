import 'package:nt_crm/functions/select_gender.dart';
import 'package:nt_crm/functions/validator.dart';
import 'package:nt_crm/models/student.dart';
import 'package:nt_crm/app.dart';

Student signUpAsStudent() {
  late bool isMale;
  var id = validator("ID");
  var firstName = validator("Ism");
  var lastName = validator("Familiya");
  var password = validator("Parol");
  isMale = selectGender();
  var course = validator("Kurs");

  return repository.createStudent(
    isMale: isMale,
    course: course,
    firstName: firstName,
    id: id,
    lastName: lastName,
    password: password,
  );
}


