import 'package:flutter/material.dart';
import 'package:ioaon_mobile/constants/ioaon_global.dart';

import '../../utils/locale/app_localization.dart';
import '../../utils/tools/logging.dart';

class RadioDisplayWidget<T> extends StatefulWidget {
  final T? initValue;
  final List<T>? list;
  final Function(T)? onChange;

  const RadioDisplayWidget({
    Key? key,
    this.onChange,
    this.initValue,
    this.list}) : super(key: key);

  @override
  State<RadioDisplayWidget> createState() => _RadioDisplayWidgetState();
}

class _RadioDisplayWidgetState<T> extends State<RadioDisplayWidget> {
  final log = logger(RadioDisplayWidget);
  T? _group;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    log.w('>>>>> didChangeDependencies()');
    log.w('widget.list = ${widget.list}');

    if (widget.initValue != null) _group = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ...(widget.list ?? [])
            .map((e) => Expanded(
              flex: 1,
              child: RadioListTile<T>(
                    title: Text(e.nameTh),
                    value: e,
                    groupValue: _group,
                    onChanged: (T? value) {
                      if (widget.onChange != null && value != null) {
                        widget.onChange!(value);
                      }
                      setState(() {
                        _group = value;
                      });
                    },
                  ),
            ))
            .toList()
      ],
    );
  }
}
