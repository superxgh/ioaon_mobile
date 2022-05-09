import 'package:flutter/material.dart';

import '../../constants/ioaon_global.dart';
import '../../utils/navigator/navigator_tools.dart';
import '../../utils/routes/routes.dart';
import '../../widgets/ioaon/ioaon_logo.dart';

class DisplayTextScreen extends StatelessWidget {

  final String text;
  final bool? isShowLogo;

  const DisplayTextScreen({Key? key, required this.text, this.isShowLogo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100.0,
              ),
              if (isShowLogo ?? false) IconOnTabWidget(
                imagePath: ioaonConfig['logo'],
                onTap: () { gotoRoute(context, Routes.signin); } ,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
