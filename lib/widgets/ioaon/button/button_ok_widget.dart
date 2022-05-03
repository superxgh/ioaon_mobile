import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../rounded_button_widget.dart';

class ButtonOkWidget extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;

  const ButtonOkWidget({
    Key? key,
    required this.text,
    required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedButtonWidget(
      buttonText: text,
      buttonColor: Colors.orangeAccent,
      textColor: Colors.white,
      onPressed: onPressed,
    );
  }
}
