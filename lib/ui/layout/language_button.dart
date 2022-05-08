import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_dialog/material_dialog.dart';
import 'package:provider/provider.dart';

import '../../stores/language/language_store.dart';
import '../../stores/theme/theme_store.dart';
import '../../utils/locale/app_localization.dart';

class LanguageButtonWidget extends StatefulWidget {
  const LanguageButtonWidget({Key? key}) : super(key: key);

  @override
  State<LanguageButtonWidget> createState() => _LanguageButtonWidgetState();
}

class _LanguageButtonWidgetState extends State<LanguageButtonWidget> {


  late ThemeStore _themeStore;
  late LanguageStore _languageStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores
    _languageStore = Provider.of<LanguageStore>(context);
    _themeStore = Provider.of<ThemeStore>(context);
  }


  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _buildLanguageDialog(context, _languageStore, _themeStore);
      },
      icon: Icon(
        Icons.language,
      ),
    );
  }


  _buildLanguageDialog(BuildContext context, LanguageStore _languageStore, ThemeStore _themeStore) {
    _showDialog<String>(
      context: context,
      child: MaterialDialog(
        borderRadius: 5.0,
        enableFullWidth: true,
        title: Text(
          AppLocalizations.of(context).translate('common_choose_language'),
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        headerColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        closeButtonColor: Colors.white,
        enableCloseButton: true,
        enableBackButton: false,
        onCloseButtonClicked: () {
          Navigator.of(context).pop();
        },
        children: _languageStore.supportedLanguages
            .map(
              (object) => ListTile(
            dense: true,
            contentPadding: EdgeInsets.all(0.0),
            title: Text(
              object.language!,
              style: TextStyle(
                color: _languageStore.locale == object.locale
                    ? Theme.of(context).primaryColor
                    : _themeStore.darkMode ? Colors.white : Colors.black,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              // change user language based on selected locale
              _languageStore.changeLanguage(object.locale!);
            },
          ),
        )
            .toList(),
      ),
    );
  }



  _showDialog<T>({required BuildContext context, required Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T? value) {
      // The value passed to Navigator.pop() or null.
    });
  }


}
