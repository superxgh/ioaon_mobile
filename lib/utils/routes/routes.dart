import 'package:ioaon_mobile/ui/accounting/personal.dart';
import 'package:ioaon_mobile/ui/menu/accounting.dart';
import 'package:ioaon_mobile/ui/menu/main.dart';
import 'package:ioaon_mobile/ui/user/forgot_password.dart';
import 'package:ioaon_mobile/ui/user/signin.dart';
import 'package:ioaon_mobile/ui/splash.dart';
import 'package:flutter/material.dart';

import '../../ui/user/signup.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String forgotPassword = '/forgotPassword';
  static const String signUp = '/signUp';
  static const String mainMenu = '/mainMenu';
  static const String accountingMenu = '/accountingMenu';
  static const String accountingPersonal = '/accountingPersonal';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => SignInScreen(),
    forgotPassword: (BuildContext context) => ForgotPasswordScreen(),
    signUp: (BuildContext context) => SignUpScreen(),
    mainMenu: (BuildContext context) => MainMenuScreen(),
    accountingMenu: (BuildContext context) => AccountingMenuScreen(),
    accountingPersonal: (BuildContext context) => AccountingPersonalScreen(),
  };
}



