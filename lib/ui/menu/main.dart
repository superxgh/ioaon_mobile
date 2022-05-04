import 'package:ioaon_mobile/constants/ioaon_global.dart';
import 'package:ioaon_mobile/stores/language/language_store.dart';
import 'package:ioaon_mobile/stores/post/post_store.dart';
import 'package:ioaon_mobile/stores/theme/theme_store.dart';
import 'package:ioaon_mobile/ui/layout/app_layout.dart';
import 'package:ioaon_mobile/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ioaon_mobile/utils/navigator/navigator_tools.dart';
import 'package:ioaon_mobile/utils/routes/routes.dart';
import 'package:provider/provider.dart';
import '../../widgets/ioaon/button/language_button.dart';
import '../../widgets/ioaon/button/logout_button.dart';
import '../../widgets/ioaon/button/theme_button.dart';
import '../../widgets/ioaon/error_tool.dart';
import '../../widgets/ioaon/button/menu_button.dart';

class MainMenuScreen extends StatefulWidget {
  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
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
        title: AppLocalizations.of(context).translate('main_menu_label'),
        storeList: [_postStore],
        body: _buildBody()
    );
  }

  Widget _buildBody() {
        return GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          children: [
            ...mainMenu.map((e) => MenuButton(
              text: e['name'],
              onPressed: () {
                gotoRoute(context, e['route']);
                })).toList()
          ],
        );
  }

}