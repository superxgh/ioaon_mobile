import 'package:flutter/material.dart';

import '../../utils/locale/app_localization.dart';

class CardWidget extends StatefulWidget {

  final String? title;
  final Widget child;
  final VoidCallback? onOkPressed;
  final VoidCallback? onResetPressed;
  final bool? isShowMaxMinButton;
  final bool isEnabledForm;

  const CardWidget({
    Key? key,
    required this.child,
    this.onOkPressed,
    this.onResetPressed,
    this.title,
    this.isShowMaxMinButton,
    required this.isEnabledForm}) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {

  bool _isEnabledForm = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isEnabledForm = widget.isEnabledForm;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
              title: Text(widget.title ?? '',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600 ),
              ),
              trailing: (widget.isShowMaxMinButton ?? false)
                        ? IconButton(
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
                        : Text('')

          ),
          if (_isEnabledForm) widget.child,
          if (_isEnabledForm) Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              if (widget.onOkPressed != null) TextButton(
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
