import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ioaon_mobile/utils/navigator/navigator_tools.dart';
import 'package:provider/provider.dart';

import '../../constants/ioaon_global.dart';
import '../../stores/language/language_store.dart';
import '../../stores/post/post_store.dart';
import '../../stores/theme/theme_store.dart';
import '../../utils/locale/app_localization.dart';
import '../../utils/routes/routes.dart';
import '../layout/language_button.dart';
import '../layout/logout_button.dart';
import '../../widgets/ioaon/button/menu_button.dart';
import '../layout/theme_button.dart';
import '../layout/app_layout.dart';

class SettingMenuScreen extends StatefulWidget {
  const SettingMenuScreen({Key? key}) : super(key: key);

  @override
  State<SettingMenuScreen> createState() => _SettingMenuScreenState();
}

class _SettingMenuScreenState extends State<SettingMenuScreen> {
  //stores:---------------------------------------------------------------------
  late PostStore _postStore;
  late ThemeStore _themeStore;
  late LanguageStore _languageStore;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores
    _languageStore = Provider.of<LanguageStore>(context);
    _themeStore = Provider.of<ThemeStore>(context);
    _postStore = Provider.of<PostStore>(context);

  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
        route: Routes.mainMenu,
        title: AppLocalizations.of(context).translate('setting_menu_label'),
        errorList: [_postStore.errorStore.errorMessage],
        body: _buildBody()
    );
  }

  Widget _buildBody() {
        return GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          children: [
            ...settingMenu.map((e) => MenuButton(
                text: AppLocalizations.of(context).translate(e['code']),
                onPressed: () {
              gotoRoute(context, e['route']);
            })).toList()
          ],
        );
  }

}
