import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import '../locale/app_localization.dart';

Widget displayErrorMessage(BuildContext context, String? message) {
    if((message ?? 'undefined') != '')
      FlushbarHelper.createError(
        message: AppLocalizations.of(context).translate(message!),
        title: AppLocalizations.of(context).translate('common_error'),
        duration: Duration(seconds: 3),
      )..show(context);
    return SizedBox.shrink();
}