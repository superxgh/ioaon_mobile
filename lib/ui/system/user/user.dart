import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../../../utils/locale/app_localization.dart';
import '../../../utils/routes/routes.dart';
import '../../layout/app_layout.dart';

class SettingUserScreen extends StatefulWidget {
  const SettingUserScreen({Key? key}) : super(key: key);

  @override
  State<SettingUserScreen> createState() => _SettingUserScreenState();
}

class _SettingUserScreenState extends State<SettingUserScreen> {


  @override
  Widget build(BuildContext context) {

    log('build', name: 'SettingUserScreen');

    return AppLayout(
        route: Routes.mainMenu,
        title: AppLocalizations.of(context).translate('setting_user_label'),
        body: _buildBody()
    );
  }

  Widget _buildBody() {
    return  Container(child: Text('Hello'));
  }


}
