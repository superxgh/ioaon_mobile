import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../stores/theme/theme_store.dart';

class ThemeButtonWidget extends StatefulWidget {
  const ThemeButtonWidget({Key? key}) : super(key: key);

  @override
  State<ThemeButtonWidget> createState() => _ThemeButtonWidgetState();
}

class _ThemeButtonWidgetState extends State<ThemeButtonWidget> {


  late ThemeStore _themeStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores
    _themeStore = Provider.of<ThemeStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return IconButton(
          onPressed: () {
            _themeStore.changeBrightnessToDark(!_themeStore.darkMode);
          },
          icon: Icon(
            _themeStore.darkMode ? Icons.brightness_5 : Icons.brightness_3,
          ),
        );
      },
    );
  }
}
