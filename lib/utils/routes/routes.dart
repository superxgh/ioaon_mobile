import 'package:ioaon_mobile/ui/account/business.dart';
import 'package:ioaon_mobile/ui/account/family.dart';
import 'package:ioaon_mobile/ui/account/personal.dart';
import 'package:ioaon_mobile/ui/menu/account.dart';
import 'package:ioaon_mobile/ui/menu/main.dart';
import 'package:ioaon_mobile/ui/system/user/user.dart';
import 'package:ioaon_mobile/ui/system/user/forgot_password.dart';
import 'package:ioaon_mobile/ui/system/user/signin.dart';
import 'package:ioaon_mobile/ui/splash.dart';
import 'package:flutter/material.dart';

import '../../ui/menu/setting.dart';
import '../../ui/system/user/signup.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String signin = '/signin';
  static const String forgotPassword = '/forgotPassword';
  static const String signUp = '/signUp';
  static const String mainMenu = '/mainMenu';
  static const String accountMenu = '/accountMenu';
  static const String settingMenu = '/settingMenu';

  // ACCOUNT
  static const String accountPersonal = '/accountPersonal';
  static const String accountFamily = '/accountFamily';
  static const String accountBusiness = '/accountBusiness';

  // ACCOUNT
  static const String settingUser = '/settingUser';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    signin: (BuildContext context) => SignInScreen(),
    forgotPassword: (BuildContext context) => ForgotPasswordScreen(),
    signUp: (BuildContext context) => SignUpScreen(),
    mainMenu: (BuildContext context) => MainMenuScreen(),

    // ACCOUNT
    accountMenu: (BuildContext context) => AccountMenuScreen(),
    accountPersonal: (BuildContext context) => AccountPersonalScreen(),
    accountFamily: (BuildContext context) => AccountFamilyScreen(),
    accountBusiness: (BuildContext context) => AccountBusinessScreen(),

    // SETTING
    settingMenu: (BuildContext context) => SettingMenuScreen(),
    settingUser: (BuildContext context) => SettingUserScreen(),
  };
}



