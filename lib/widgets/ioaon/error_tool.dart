import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../utils/locale/app_localization.dart';


class ErrorMessageViewer extends StatelessWidget {

  final dynamic store;

  const ErrorMessageViewer({
    Key? key,
    this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (store.errorStore.errorMessage.isNotEmpty) {
          return showErrorMessage(context, store.errorStore.errorMessage!);
        }
        return SizedBox.shrink();
      },
    );
  }

  // General Methods:-----------------------------------------------------------
  showErrorMessage(BuildContext context, String message) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (message.isNotEmpty) {
        FlushbarHelper.createError(
          message: message,
          title: AppLocalizations.of(context).translate('home_tv_error'),
          duration: Duration(seconds: 3),
        )
          ..show(context);
      }
    });

    return SizedBox.shrink();
  }

}

