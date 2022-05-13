import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/ioaon_global.dart';
import '../../../data/sharedpref/constants/preferences.dart';
import '../../../stores/theme/theme_store.dart';
import '../../../stores/user/forgot_password_form.dart';
import '../../../utils/locale/app_localization.dart';
import '../../../utils/navigator/navigator_tools.dart';
import '../../../utils/routes/routes.dart';
import '../../../widgets/empty_app_bar_widget.dart';
import '../../../widgets/ioaon/button/button_ok_widget.dart';
import '../../../widgets/ioaon/ioaon_logo.dart';
import '../../../widgets/ioaon/text_input_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  //text controllers:-----------------------------------------------------------
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  //stores:---------------------------------------------------------------------
  late ThemeStore _themeStore;

  //focus node:-----------------------------------------------------------------
  late FocusNode _passwordFocusNode;

  //stores:---------------------------------------------------------------------
  final _form = ForgotPasswordForm();

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeStore = Provider.of<ThemeStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: EmptyAppBar(),
      body: _buildBody(),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Material(
      child: _buildMobileLayout(),
    );
  }

  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 24.0),
            IconOnTabWidget(
              imagePath: ioaonConfig['logo'],
              onTap: () { gotoRoute(context, Routes.signin); } ,
            ),
            SizedBox(height: 10.0),
            Align(
                alignment: Alignment.center,
                child: Text(
                  AppLocalizations.of(context).translate('forgot_password_header'),
                  style: TextStyle(fontSize: 30.0),
                )
            ),
            SizedBox(height: 24.0),
            _buildEmailField(),
            SizedBox(height: 24.0),
            _buildSignUpButton(),
          ],
        ),
      ),
    );
  }
  Widget _buildEmailField() {
    return Observer(
      builder: (context) {
        return TextInputWidget(
            hint: AppLocalizations.of(context).translate('forgot_password_email'),
            inputType: TextInputType.text,
            icon: Icons.email,
            isDarkMode: _themeStore.darkMode,
            textController: _emailController,
            inputAction: TextInputAction.next,
            onChanged: (value) {
              _form.setEmail(_emailController.text);
            },
            onFieldSubmitted: (value) {
              // FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
            errorText: _form.formErrorStore.email);
      },
    );
  }
  Widget _buildSignUpButton() {
    return ButtonOkWidget(
      text: AppLocalizations.of(context).translate('forgot_password_send_btn'),
      onPressed: () async {
      },
    );
  }

  Widget navigate(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(Preferences.is_logged_in, true);
    });

    Future.delayed(Duration(milliseconds: 0), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.mainMenu, (Route<dynamic> route) => false);
    });

    return Container();
  }


  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _fullNameController.dispose();
    super.dispose();
  }
}
