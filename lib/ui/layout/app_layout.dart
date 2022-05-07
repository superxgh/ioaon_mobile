import 'package:flutter/material.dart';
import '../../utils/navigator/navigator_tools.dart';
import '../../utils/routes/routes.dart';
import '../../widgets/ioaon/button/language_button.dart';
import '../../widgets/ioaon/button/logout_button.dart';
import '../../widgets/ioaon/button/theme_button.dart';
import '../../utils/tools/error_tool.dart';

class AppLayout extends StatelessWidget {

  final String title;
  final List<dynamic> storeList;
  final Widget body;
  final String? route;

  const AppLayout({
    Key? key,
    required this.title,
    required this.storeList,
    required this.body,
    this.route}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, route),
      body: _buildBody(),
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
  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        ...storeList.map((e) =>  ErrorMessageViewer(store: e)).toList(),
        body,
      ],
    );
  }

}
