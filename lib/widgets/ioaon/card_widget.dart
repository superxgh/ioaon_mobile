import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/locale/app_localization.dart';

class CardWidget extends StatefulWidget {

  final String? title;
  final Widget child;
  final VoidCallback onOkPressed;
  final VoidCallback? onResetPressed;

  const CardWidget({
    Key? key,
    required this.child,
    required this.onOkPressed,
    this.onResetPressed, this.title}) : super(key: key);

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
              // leading: Icon(Icons.album),
              title: Text(widget.title ?? '',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600 ),
              ),
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
                child: Text(AppLocalizations.of(context).translate('common_save')),
                onPressed: widget.onOkPressed,
              ),
              const SizedBox(width: 8),
              if (widget.onResetPressed != null) TextButton(
                child: Text(AppLocalizations.of(context).translate('common_reset')),
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
