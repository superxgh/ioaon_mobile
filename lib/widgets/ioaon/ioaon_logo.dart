import 'package:flutter/material.dart';
import '../app_icon_widget.dart';

class IconOnTabWidget extends StatelessWidget {

  final String imagePath;
  final GestureTapCallback? onTap;

  const IconOnTabWidget({Key? key, required this.imagePath, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        splashColor: Colors.white10,
        child: AppIconWidget(
            image: imagePath
        )
    );
  }
}
