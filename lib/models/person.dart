
// CTRL .
abstract class Person {
   final String firstName;
   final String lastName;
   final bool isMale;
   const Person({
    required this.firstName,
    required this.lastName,
    required this.isMale,
  });

  @override
  String toString() => 'Person(firstName: $firstName, lastName: $lastName, isMale: $isMale)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Person &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.isMale == isMale;
  }

  @override
  int get hashCode => firstName.hashCode ^ lastName.hashCode ^ isMale.hashCode;
}
