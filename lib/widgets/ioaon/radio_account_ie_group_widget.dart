import 'package:flutter/material.dart';
import 'package:ioaon_mobile/constants/ioaon_global.dart';

import '../../utils/locale/app_localization.dart';

class RadioAccountIETypeWidget extends StatefulWidget {
  final AccountIEType? initValue;
  final Function(String)? onChange;

  const RadioAccountIETypeWidget({Key? key, this.onChange, this.initValue}) : super(key: key);

  @override
  State<RadioAccountIETypeWidget> createState() => _RadioAccountIETypeWidgetState();
}

class _RadioAccountIETypeWidgetState extends State<RadioAccountIETypeWidget> {
  AccountIEType? _group;

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
        ...AccountIEType.values
            .map((e) => Expanded(
              flex: 1,
              child: RadioListTile<AccountIEType>(
                    title: Text(AppLocalizations.of(context).translate('common_${e.name.toLowerCase()}')),
                    value: e,
                    groupValue: _group,
                    onChanged: (AccountIEType? value) {
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
