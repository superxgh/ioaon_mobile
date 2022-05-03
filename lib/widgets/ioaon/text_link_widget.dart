import 'package:flutter/material.dart';

class TextLinkWidget extends StatelessWidget {

  final String text;
  final VoidCallback? onPressed;
  final AlignmentGeometry? alignment;

  const TextLinkWidget({
    Key? key,
    required this.text,
    this.onPressed,
    this.alignment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? FractionalOffset.centerRight,
      child: TextButton(
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(color: Colors.orangeAccent),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
