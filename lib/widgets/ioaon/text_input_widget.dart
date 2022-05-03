import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../textfield_widget.dart';

class TextInputWidget extends StatelessWidget {
  final String? hint;
  final TextInputType? inputType;
  final IconData icon;
  final bool isDarkMode;
  final TextEditingController textController;
  final TextInputAction? inputAction;
  final ValueChanged? onFieldSubmitted;
  final ValueChanged? onChanged;
  final String? errorText;
  final bool? isObscure;
  final FocusNode? focusNode;
  final EdgeInsets? padding;

  const TextInputWidget(
      {Key? key,
      this.hint,
      this.inputType,
      required this.icon,
      required this.isDarkMode,
      required this.textController,
      this.inputAction,
      this.onFieldSubmitted,
      this.onChanged,
      this.errorText,
      this.isObscure,
      this.focusNode, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
        hint: hint,
        inputType: inputType,
        icon: icon,
        iconColor: isDarkMode ? Colors.white70 : Colors.black54,
        textController: textController,
        inputAction: inputAction,
        autoFocus: false,
        isObscure: isObscure ?? false,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        errorText: errorText,
        focusNode: focusNode,
        padding: padding ??  const EdgeInsets.all(0));
  }
}
