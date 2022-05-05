import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../routes/routes.dart';

Widget gotoRoute(BuildContext context, String route) {
  log('gotoRoute -> $route');
  Future.delayed(Duration(milliseconds: 0), () {
    Navigator.of(context).pushNamedAndRemoveUntil(
        route, (Route<dynamic> route) => false);
  });

  return Container();
}