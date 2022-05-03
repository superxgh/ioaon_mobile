import 'package:flutter/material.dart';

class LogoutButtonWidget extends StatelessWidget {
  const LogoutButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // SharedPreferences.getInstance().then((preference) {
        //   preference.setBool(Preferences.is_logged_in, false);
        //   Navigator.of(context).pushReplacementNamed(Routes.login);
        // });
      },
      icon: Icon(
        Icons.power_settings_new,
      ),
    );
  }
}
