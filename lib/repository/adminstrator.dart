import 'package:nt_crm/models/admin.dart';

// Alt Shif F - formatter
// Alt Shif L - formatter for JetBrains

/// Interface
abstract class AdminRepository {
  List<Admin> admins = [];

  factory AdminRepository() => AdminRepositoryImpl();

  Admin createAdmin({
    required String id,
    required String firstName,
    required String lastName,
    required String password,
    required bool isMale,
  });

  bool deleteAdmin(String id);

  bool updateAdmin(String id, Admin admin);

  Admin fetchAdmin(String id, String password);

  List<Admin> fetchAdmins();
}

class AdminRepositoryImpl implements AdminRepository {
  @override
  List<Admin> admins = [];

  @override
  Admin createAdmin({
    required String id,
    required String firstName,
    required String lastName,
    required String password,
    required bool isMale,
  }) {
    var newAdmin = Admin(
      id: id,
      firstName: firstName,
      lastName: lastName,
      password: password,
      isMale: isMale,
    );

    admins.add(newAdmin);

    return newAdmin;
  }

  @override
  bool deleteAdmin(String id) {
    late bool isDeleted = false;

    try {
      for (Admin admin in admins) {
        if (admin.id == id) {
          admins.remove(admin);
          isDeleted = true;
          break; // Exit the loop when the student is found
        }
      }
    } catch (e) {
      isDeleted = false;
      // Handle the exception here
      print("An error occurred: $e");
    }

    return isDeleted;
  }

  @override
  Admin fetchAdmin(String id, String password) {
    var searchedAdmin = admins.firstWhere(
        (element) => element.id == id && element.password == password);
    return searchedAdmin;
  }

  @override
  List<Admin> fetchAdmins() {
    return admins;
  }

  @override
  bool updateAdmin(String id, Admin admin) {
    // TODO: implement updateAdmin
    throw UnimplementedError();
  }
}
