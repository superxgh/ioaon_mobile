import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ioaon_mobile/utils/navigator/navigator_tools.dart';
import 'package:provider/provider.dart';
import '../../constants/ioaon_global.dart';
import '../../utils/tools/logging.dart';
import '../../stores/language/language_store.dart';
import '../../stores/post/post_store.dart';
import '../../stores/theme/theme_store.dart';
import '../../utils/locale/app_localization.dart';
import '../../utils/routes/routes.dart';
import '../../widgets/ioaon/button/menu_button.dart';
import '../layout/app_layout.dart';

class AccountMenuScreen extends StatefulWidget {
  const AccountMenuScreen({Key? key}) : super(key: key);

  @override
  State<AccountMenuScreen> createState() => _AccountMenuScreenState();
}

class _AccountMenuScreenState extends State<AccountMenuScreen> {

  final log = logger(AccountMenuScreen);

  //stores:---------------------------------------------------------------------
  late PostStore _postStore;
  late ThemeStore _themeStore;
  late LanguageStore _languageStore;

  @override
  void initState() {
    super.initState();
    log.i('initState()');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    log.i('didChangeDependencies()');

    // initializing stores
    _languageStore = Provider.of<LanguageStore>(context);
    _themeStore = Provider.of<ThemeStore>(context);
    _postStore = Provider.of<PostStore>(context);

  }

  @override
  Widget build(BuildContext context) {
    log.i('build()');
    return AppLayout(
        route: Routes.mainMenu,
        title: AppLocalizations.of(context).translate('account_menu_label'),
        storeList: [_postStore],
        body: _buildBody()
    );
  }

  Widget _buildBody() {
    log.i('_buildBody()');
        return GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          children: [
            ...accountMenu.map((e) => MenuButton(
                text: AppLocalizations.of(context).translate(e['code']),
                onPressed: () {
                  log.d('_buildBody() goto ${e['route']}');
                  gotoRoute(context, e['route']);
                })).toList()
          ],
        );
  }

}
