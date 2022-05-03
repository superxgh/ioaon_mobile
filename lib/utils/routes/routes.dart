import 'package:ioaon_mobile/ui/menu/accounting.dart';
import 'package:ioaon_mobile/ui/menu/main.dart';
import 'package:ioaon_mobile/ui/login/login.dart';
import 'package:ioaon_mobile/ui/splash/splash.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String mainMenu = '/mainMenu';
  static const String accountingMenu = '/accountingMenu';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    mainMenu: (BuildContext context) => MainMenuScreen(),
    accountingMenu: (BuildContext context) => AccountingMenuScreen(),
  };
}



