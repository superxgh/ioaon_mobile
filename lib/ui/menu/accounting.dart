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
import '../../widgets/ioaon/button/language_button.dart';
import '../../widgets/ioaon/button/logout_button.dart';
import '../../widgets/ioaon/button/menu_button.dart';
import '../../widgets/ioaon/button/theme_button.dart';
import '../../widgets/ioaon/error_tool.dart';
import '../layout/app_layout.dart';

class AccountingMenuScreen extends StatefulWidget {
  const AccountingMenuScreen({Key? key}) : super(key: key);

  @override
  State<AccountingMenuScreen> createState() => _AccountingMenuScreenState();
}

class _AccountingMenuScreenState extends State<AccountingMenuScreen> {
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
        title: AppLocalizations.of(context).translate('accounting_menu_label'),
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
            ...accountingMenu.map((e) => MenuButton(
                text: AppLocalizations.of(context).translate(e['code']),
                onPressed: () {
              gotoRoute(context, e['route']);
            })).toList()
          ],
        );
  }

}
