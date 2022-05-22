import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:ioaon_mobile/constants/app_theme.dart';
import 'package:ioaon_mobile/constants/strings.dart';
import 'package:ioaon_mobile/data/repository.dart';
import 'package:ioaon_mobile/data/sharedpref/constants/preferences.dart';
import 'package:ioaon_mobile/stores/account/account_store.dart';
import 'package:ioaon_mobile/stores/language/language_store.dart';
import 'package:ioaon_mobile/stores/post/post_store.dart';
import 'package:ioaon_mobile/stores/reference/reference_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ioaon_mobile/stores/theme/theme_store.dart';
import 'package:ioaon_mobile/stores/user/user_store.dart';
import 'package:ioaon_mobile/ui/system/user/signin.dart';
import 'package:ioaon_mobile/utils/locale/app_localization.dart';
import 'package:ioaon_mobile/utils/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global_function.dart';

void main() {
  // This method provided by `flutter_test` is called before each test.
  var getIt;
  late ReferenceStore _referenceStore;
  late UserStore _userStore;
  late ThemeStore _themeStore;
  late PostStore _postStore;
  late LanguageStore _languageStore;
  late AccountStore _accountStore;

  setUp(() async {
    // Set getit
    await GetIt.I.reset();
    getIt = await regisGetIt();
    _userStore = UserStore(getIt<Repository>());
    _themeStore = ThemeStore(getIt<Repository>());
    _postStore = PostStore(getIt<Repository>());
    _languageStore = LanguageStore(getIt<Repository>());
    _accountStore = AccountStore(getIt<Repository>());
    _referenceStore = ReferenceStore(getIt<Repository>());
  });

  Widget makeTestableWidget({ required Widget child }) {
    return MultiProvider(
      providers: [
        Provider<ThemeStore>(create: (_) => _themeStore),
        Provider<PostStore>(create: (_) => _postStore),
        Provider<LanguageStore>(create: (_) => _languageStore),
        Provider<AccountStore>(create: (_) => _accountStore),
        Provider<UserStore>(create: (_) => _userStore),
        Provider<ReferenceStore>(create: (_) => _referenceStore),
      ],
      child: Builder(
        builder: (_) => MaterialApp(
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
            home: child
        ),
      ),
    );
  };


  testWidgets('Display SignInScreen -> Should have to success', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: SignInScreen(key: Key('K'))));
    await tester.pumpAndSettle();

    expect(find.byKey(Key('K')), findsOneWidget);
    expect(find.byKey(Key('user_email')), findsOneWidget);

  });


  test('SignIn user -> Should have to success', () async {
    var data = {"email": 'a@a.com', "password": '123456'};
    await _userStore.signin(data);
    expect(true, 0 < (_userStore.currentUser.authToken ?? '').length);
  });


}
