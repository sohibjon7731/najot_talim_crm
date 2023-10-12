// TODO 1: Talaba klasini yaratish
// CTRL + .
import 'package:nt_crm/models/authenticated_user.dart';

class Admin extends AuthenticatedUser {
  final String id;

  final String password;
  final String? email;

  const Admin({
    required this.id,
    required super.firstName,
    required super.lastName,
    required this.password,
    required super.isMale,
    this.email,
  });

  Admin copyWith({
    String? firstName,
    String? lastName,
    String? password,
    String? email,
  }) {
    return Admin(
      id: id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
      isMale: isMale,
      email: email ?? this.email,
    );
  }

  @override
  String toString() {
    return 'Adminstrator(id: $id, firstName: $firstName, lastName: $lastName, password: $password, email: $email, isMale: $isMale)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Admin &&
        other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.password == password &&
        other.email == email &&
        other.isMale == isMale;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        password.hashCode ^
        email.hashCode ^
        isMale.hashCode;
  }
}
