import 'package:flutter/material.dart';
import 'package:ioaon_mobile/constants/ioaon_global.dart';

import '../../utils/locale/app_localization.dart';

class RadioAccountIEGroupWidget extends StatefulWidget {
  final AccountIEGroup? initValue;
  final Function(String)? onChange;

  const RadioAccountIEGroupWidget({Key? key, this.onChange, this.initValue}) : super(key: key);

  @override
  State<RadioAccountIEGroupWidget> createState() => _RadioAccountIEGroupWidgetState();
}

class _RadioAccountIEGroupWidgetState extends State<RadioAccountIEGroupWidget> {
  AccountIEGroup? _group;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (widget.initValue != null) _group = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ...AccountIEGroup.values
            .map((e) => Expanded(
              flex: 1,
              child: RadioListTile<AccountIEGroup>(
                    title: Text(AppLocalizations.of(context).translate('common_${e.name.toLowerCase()}')),
                    value: e,
                    groupValue: _group,
                    onChanged: (AccountIEGroup? value) {
                      if (widget.onChange != null && value != null) {
                        widget.onChange!(value.name);
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
