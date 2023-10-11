import 'package:nt_crm/models/person.dart';

class AuthenticatedUser extends Person {
  const AuthenticatedUser({
    required super.firstName,
    required super.lastName,
    required super.isMale,
  });
}
