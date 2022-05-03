import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/locale/app_localization.dart';

class DisplayErrorMessageWidget extends StatelessWidget {

  final String message;

  const DisplayErrorMessageWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (message.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          FlushbarHelper.createError(
            message: message,
            title: AppLocalizations.of(context).translate('home_tv_error'),
            duration: Duration(seconds: 3),
          )..show(context);
        }
      });
    }

    return SizedBox.shrink();
  }
}
