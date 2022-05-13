import 'dart:developer';

import 'package:ioaon_mobile/constants/app_theme.dart';
import 'package:ioaon_mobile/constants/strings.dart';
import 'package:ioaon_mobile/data/repository.dart';
import 'package:ioaon_mobile/di/components/service_locator.dart';
import 'package:ioaon_mobile/stores/language/language_store.dart';
import 'package:ioaon_mobile/stores/post/post_store.dart';
import 'package:ioaon_mobile/stores/theme/theme_store.dart';
import 'package:ioaon_mobile/stores/user/user_store.dart';
import 'package:ioaon_mobile/ui/menu/main.dart';
import 'package:ioaon_mobile/ui/system/user/signin.dart';
import 'package:ioaon_mobile/utils/locale/app_localization.dart';
import 'package:ioaon_mobile/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../stores/reference/reference_store.dart';
import '../utils/tools/logging.dart';
import '../stores/account/account_store.dart';
import 'layout/display_text_message.dart';

class MyApp extends StatelessWidget {
  final log = logger(MyApp);
  final ThemeStore _themeStore = ThemeStore(getIt<Repository>());
  final PostStore _postStore = PostStore(getIt<Repository>());
  final LanguageStore _languageStore = LanguageStore(getIt<Repository>());
  final UserStore _userStore = UserStore(getIt<Repository>());
  final AccountStore _accountStore = AccountStore(getIt<Repository>());
  final ReferenceStore _referenceStore = ReferenceStore(getIt<Repository>());

  @override
  Widget build(BuildContext context) {
    log.i('build()');
    return MultiProvider(
      providers: [
        Provider<ThemeStore>(create: (_) => _themeStore),
        Provider<PostStore>(create: (_) => _postStore),
        Provider<LanguageStore>(create: (_) => _languageStore),
        Provider<AccountStore>(create: (_) => _accountStore),
        Provider<UserStore>(create: (_) => _userStore),
        Provider<ReferenceStore>(create: (_) => _referenceStore),
      ],
      child: Observer(
        name: 'global-observer',
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Strings.appName,
            theme: _themeStore.darkMode
                ? AppThemeData.darkThemeData
                : AppThemeData.lightThemeData,
            routes: Routes.routes,
            locale: Locale(_languageStore.locale),
            supportedLocales: _languageStore.supportedLanguages
                .map((language) => Locale(language.locale!, language.code))
                .toList(),
            localizationsDelegates: [
              // A class which loads the translations from JSON files
              AppLocalizations.delegate,
              // Built-in localization of basic text for Material widgets
              GlobalMaterialLocalizations.delegate,
              // Built-in localization for text direction LTR/RTL
              GlobalWidgetsLocalizations.delegate,
              // Built-in localization of basic text for Cupertino widgets
              GlobalCupertinoLocalizations.delegate,
            ],
            home: gotoTarget(
                _userStore.isLoading,
                _userStore.currentUser.mobileNumber,
                _userStore.isLoggedIn)
          );
        },
      ),
    );
  }

  Widget gotoTarget(bool isLoading, String? mobileNumber, bool isLoggedIn) {
    log.i('gotoTarget()');
    log.i('isLoading = $isLoading');
    log.i('mobileNumber = $mobileNumber');
    log.i('isLoggedIn = $isLoggedIn');

    if (isLoading)
      return DisplayTextScreen(text: 'Loading');
    else if (mobileNumber == null)
      return SignInScreen();
    else if (mobileNumber == '')
      return DisplayTextScreen(text: 'Can\'t connect to backend.', isShowLogo: true);
    else if(isLoggedIn)
      return  MainMenuScreen();
    else
      return SignInScreen();
  }

}
