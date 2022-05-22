import 'package:ioaon_mobile/constants/ioaon_global.dart';
import 'package:ioaon_mobile/ui/layout/app_layout.dart';
import 'package:ioaon_mobile/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:ioaon_mobile/utils/navigator/navigator_tools.dart';
import 'package:provider/provider.dart';
import '../../stores/user/user_store.dart';
import '../../utils/tools/logging.dart';
import '../../widgets/ioaon/button/menu_button.dart';

class MainMenuScreenArguments {
  late String title;

  MainMenuScreenArguments.name({
    required this.title
  });
}


class MainMenuScreen extends StatefulWidget {
  final String? title;

  const MainMenuScreen({
    Key? key,
    this.title}) : super(key: key);

  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {

  final log = logger(MainMenuScreen);

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    log.i('didChangeDependencies()');
    log.i('title = ${widget.title}');
  }

  @override
  Widget build(BuildContext context) {
    log.i('build()');
    return AppLayout(
        title: AppLocalizations.of(context).translate('home_label'),
        body: _buildBody(),
    );
  }

  Widget _buildBody() {
    log.i('_buildBody()');
        return GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          children: [
            ...mainMenu.map((e) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: MenuButton(
                text: AppLocalizations.of(context).translate(e['code']),
                onPressed: () {
                  log.d('goto ${e['route']} page.');
                  gotoRoute(context, e['route']);
                  }),
            )).toList()
          ],
        );
  }

}