import 'package:nt_crm/conts/constants.dart';
import 'package:nt_crm/functions/select_task.dart';
import 'package:nt_crm/app.dart';
import 'package:nt_crm/models/admin.dart';

void showMenu() {
  // TODO 2: Menu Driven ilova qilish
  while (!isTerminated) {
    /* clearTerminal(); */
    // TODO: Printni o'chirib tashla
    if (authenticatedUser == null) {
      print(AppConstans.signupText);
    } else if (authenticatedUser is Admin) {
      print(AppConstans.mainMenuTextAdmin);
    } else {
      print(AppConstans.mainMenuText);
    }
   /*  print(authenticatedUser == null
        ? AppConstans.signupText
        : AppConstans.mainMenuText); */
    selectTask();
  }
}
