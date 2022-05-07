import 'package:flutter/material.dart';

class CustomProgressIndicatorWidget extends StatelessWidget {

  final String? text;

  const CustomProgressIndicatorWidget({
    Key? key, this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 100,
        constraints: BoxConstraints.expand(),
        child: FittedBox(
          fit: BoxFit.none,
          child: SizedBox(
            height: 150,
            width: 100,
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: CircularProgressIndicator(),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                if (text != null) Text(text!)
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
            color: Color.fromARGB(100, 105, 105, 105)),
      ),
    );
  }
}
