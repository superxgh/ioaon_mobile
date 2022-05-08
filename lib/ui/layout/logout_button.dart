import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/sharedpref/constants/preferences.dart';
import '../../utils/routes/routes.dart';
import '../../utils/tools/logging.dart';

class LogoutButtonWidget extends StatelessWidget {
  const LogoutButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final log = logger(LogoutButtonWidget);
    log.i('build()');

    return IconButton(
      onPressed: () {
        log.w('>>>>> IconButton onPressed');
        SharedPreferences.getInstance().then((preference) {
          preference.setBool(Preferences.is_logged_in, false);
          log.w('Set SharedPreferences is_logged_in = false');
          log.w('Goto signin page');
          Navigator.of(context).pushReplacementNamed(Routes.signin);
        });
      },
      icon: Icon(
        Icons.power_settings_new,
      ),
    );
  }
}
