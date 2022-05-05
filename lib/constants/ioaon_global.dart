import 'package:ioaon_mobile/utils/routes/routes.dart';

class Global {
  Global._();

  //General
  static const String appName = "Ioaon Financial Project";
}

List<Map<String, dynamic>> mainMenu = [
  {"id": 1, "code": "home_accounting_label", "name": "Accounting", "route": Routes.accountingMenu },
  {"id": 2, "code": "home_loan_label", "name": "Loan", "route": Routes.mainMenu },
  {"id": 3, "code": "home_rotating_savings_label", "name": "Rotating Savings", "route": Routes.mainMenu },
  {"id": 4, "code": "home_credit_card_label", "name": "Credit Card", "route": Routes.mainMenu },
  {"id": 5, "code": "home_insurance_label", "name": "Insurance", "route": Routes.mainMenu },
  {"id": 6, "code": "home_trans_and_pays_label", "name": "Trans & Pays", "route": Routes.mainMenu },
  {"id": 7, "code": "home_reports_label", "name": "Reports", "route": Routes.mainMenu },
  {"id": 8, "code": "home_setting_label", "name": "Setting", "route": Routes.mainMenu },
  {"id": 9, "code": "home_todos_label", "name": "Todos", "route": Routes.mainMenu }
];


List<Map<String, dynamic>> accountingMenu = [
  {"id": 1, "code": "accounting_personal_menu_label", "name": "Personal", "route": Routes.accountingPersonal },
  {"id": 2, "code": "accounting_family_label", "name": "Family", "route": Routes.mainMenu },
  {"id": 3, "code": "accounting_business_label", "name": "Business", "route": Routes.mainMenu },
  {"id": 4, "code": "accounting_reports_label", "name": "Report", "route": Routes.mainMenu },
  {"id": 5, "code": "accounting_rd_report_label", "name": "RD Report", "route": Routes.mainMenu }
];


List<Map<String, dynamic>> accountingType = [
  {"id": 1, "name": "Income"},
  {"id": 2, "name": "Expenses"}
];


Map<String, dynamic> ioaonConfig = {
  "logo": "assets/icons/ic_appicon.png"
};