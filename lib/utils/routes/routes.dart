import 'package:ioaon_mobile/ui/account/personal.dart';
import 'package:ioaon_mobile/ui/menu/account.dart';
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
  static const String signin = '/signin';
  static const String forgotPassword = '/forgotPassword';
  static const String signUp = '/signUp';
  static const String mainMenu = '/mainMenu';
  static const String accountMenu = '/accountMenu';
  static const String accountPersonal = '/accountPersonal';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    signin: (BuildContext context) => SignInScreen(),
    forgotPassword: (BuildContext context) => ForgotPasswordScreen(),
    signUp: (BuildContext context) => SignUpScreen(),
    mainMenu: (BuildContext context) => MainMenuScreen(),
    accountMenu: (BuildContext context) => AccountMenuScreen(),
    accountPersonal: (BuildContext context) => AccountPersonalScreen(),
  };
}



