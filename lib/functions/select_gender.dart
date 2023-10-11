import 'package:nt_crm/functions/validator.dart';

bool selectGender() {
  late bool isMale;

  bool isTerminated = true;
  do {
    isTerminated = true;
    print("Genderingizni tanlang: m (male) / f (female):");
    var input = validator("Gender");
    try {
      switch (input) {
        case "m":
          isMale = true;
          break;
        case "f":
          isMale = false;
          break;
        default:
          throw Exception("Gender xato tanlangan!");
      }
    } catch (error) {
      isTerminated = false;
    }
  } while (!isTerminated);

  return isMale;
}
