import 'package:nt_crm/models/authenticated_user.dart';

class Teacher extends AuthenticatedUser {
  final String id;
  final String subject;
  final String? email;
  final int salary;
  final String password;

  const Teacher({
    required this.id,
    required this.subject,
    required this.salary,
    required this.password,
    required String firstName,
    required String lastName,
    required bool isMale,
    this.email,
  }) : super(
          firstName: firstName,
          lastName: lastName,
          isMale: isMale,
        );

  Teacher copyWith({
    String? id,
    String? subject,
    String? email,
    int? salary,
    String? firstName,
    String? lastName,
    bool? isMale,
    String? password,
  }) {
    return Teacher(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      email: email ?? this.email,
      salary: salary ?? this.salary,
      firstName: firstName ?? this.firstName,
      isMale: isMale ?? this.isMale,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
    );
  }

  @override
  String toString() {
    return 'Teacher(id: $id, subject: $subject, email: $email, salary: $salary, firstName: $firstName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Teacher &&
        other.id == id &&
        other.subject == subject &&
        other.email == email &&
        other.salary == salary;
  }

  @override
  int get hashCode {
    return id.hashCode ^ subject.hashCode ^ email.hashCode ^ salary.hashCode;
  }
}
