import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../utils/errors/error_tools.dart';
import '../../utils/navigator/navigator_tools.dart';
import '../../utils/tools/logging.dart';
import 'language_button.dart';
import 'logout_button.dart';
import 'theme_button.dart';

class AppLayout extends StatelessWidget {

  final String title;
  final Widget body;
  final String? route;

  const AppLayout({
    Key? key,
    required this.title,
    required this.body,
    this.route}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final log = logger(AppLayout);
    log.i('build()');
    return Scaffold(
      appBar: _buildAppBar(context, route),
      body: _buildBody(context),
    );
  }

  // app bar methods:-----------------------------------------------------------
  PreferredSizeWidget _buildAppBar(BuildContext context, String? route) {
    return AppBar(
      leading: (route != null)
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => gotoRoute(context, route),
            )
          : null ,
      title: Text(title),
      actions: [ThemeButtonWidget(), LogoutButtonWidget(), LanguageButtonWidget()],
    );
  }


  // body methods:--------------------------------------------------------------
  Widget _buildBody(BuildContext context) {
    return body;
  }

}
