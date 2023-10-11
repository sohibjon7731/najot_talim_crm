import 'package:nt_crm/functions/show_menu.dart';
import 'package:nt_crm/models/authenticated_user.dart';
import 'package:nt_crm/models/student.dart';
import 'package:nt_crm/models/teacher.dart';
import 'package:nt_crm/repository/student.dart';
import 'package:nt_crm/repository/teacher.dart';

AuthenticatedUser? authenticatedUser;
Teacher? teacherTest;
Student? studentTest;
late StudentRepository repository;
late TeacherRepository teacherRepository;
bool isTerminated = false;
void runApp() {
  repository = StudentRepository();
  teacherRepository = TeacherRepository();
  showMenu();

  // TODO1: Make back work in registeration
  // TODO2: Signin as a teacher
  // TODO3: Print menu for printing teachers and students
}
