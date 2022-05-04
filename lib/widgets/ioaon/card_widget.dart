import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {

  final Widget child;
  final VoidCallback? onOkPressed;
  final VoidCallback? onResetPressed;

  const CardWidget({
    Key? key,
    required this.child,
    this.onOkPressed,
    this.onResetPressed}) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {

  bool _isEnabledForm = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
              leading: Icon(Icons.album),
              title: Text('Accounting Input Form'),
              trailing: IconButton(
                  icon: new Icon(
                    (_isEnabledForm) ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    // color: isSaved(key)  ? Colors.red : null,  //<--- if key is already saved, then set it to red
                  ),
                  onPressed: ()
                  {
                    setState(() //<--whenever icon is pressed, force redraw the widget
                    {
                      _isEnabledForm = !_isEnabledForm;
                    });
                  }
              )

          ),
          if (_isEnabledForm) widget.child,
          if (_isEnabledForm) Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: widget.onOkPressed ?? () {/* ... */},
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('RESET'),
                onPressed: widget.onResetPressed ?? () {/* ... */},
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
