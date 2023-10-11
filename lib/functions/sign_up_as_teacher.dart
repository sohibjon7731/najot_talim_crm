import 'package:nt_crm/app.dart';
import 'package:nt_crm/functions/select_gender.dart';
import 'package:nt_crm/functions/validator.dart';
import 'package:nt_crm/models/teacher.dart';

Teacher signUpAsTeacher() {
  late bool isMale;
  var id = validator("ID");
  var firstName = validator("Ism");
  var lastName = validator("Familiya");
  var password = validator("Parol");
  isMale = selectGender();
  var subject = validator("Fan");

  // var  = validator("Fan");

  return teacherRepository.createTeacher(
    isMale: isMale,
    salary: 0,
    subject: subject,
    firstName: firstName,
    id: id,
    lastName: lastName,
    password: password,
  );
}
