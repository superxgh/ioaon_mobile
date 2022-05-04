import 'package:ioaon_mobile/utils/routes/routes.dart';

class Global {
  Global._();

  //General
  static const String appName = "Ioaon Financial Project";
}

List<Map<String, dynamic>> mainMenu = [
  {"id": 1, "name": "Accounting", "route": Routes.accountingMenu },
  {"id": 2, "name": "Loan", "route": Routes.mainMenu },
  {"id": 3, "name": "Credit Card", "route": Routes.mainMenu },
  {"id": 4, "name": "Payment", "route": Routes.mainMenu },
  {"id": 5, "name": "Money Transfer", "route": Routes.mainMenu },
  {"id": 6, "name": "Insurance", "route": Routes.mainMenu },
  {"id": 7, "name": "Reports", "route": Routes.mainMenu },
  {"id": 8, "name": "Setting", "route": Routes.mainMenu },
  {"id": 9, "name": "Todos", "route": Routes.mainMenu }
];


List<Map<String, dynamic>> accountingMenu = [
  {"id": 1, "name": "Personal", "route": Routes.accountingPersonal },
  {"id": 2, "name": "Family", "route": Routes.mainMenu },
  {"id": 3, "name": "Business", "route": Routes.mainMenu },
  {"id": 4, "name": "Report", "route": Routes.mainMenu },
  {"id": 5, "name": "RD Report", "route": Routes.mainMenu }
];


List<Map<String, dynamic>> accountingType = [
  {"id": 1, "name": "Income"},
  {"id": 2, "name": "Expenses"}
];