
import 'dart:developer';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';

import '../locale/app_localization.dart';

Widget displayErrorMessage(BuildContext context, String message) {
  log('message = $message');
  if (message.isNotEmpty) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (message.isNotEmpty) {
        FlushbarHelper.createError(
          message: AppLocalizations.of(context).translate(message),
          title: AppLocalizations.of(context).translate('common_error'),
          duration: Duration(seconds: 3),
        )..show(context);
      }
    });
  }

  return SizedBox.shrink();
}