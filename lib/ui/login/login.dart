import 'package:ioaon_mobile/data/sharedpref/constants/preferences.dart';
import 'package:ioaon_mobile/utils/navigator/navigator_tools.dart';
import 'package:ioaon_mobile/utils/routes/routes.dart';
import 'package:ioaon_mobile/stores/form/form_store.dart';
import 'package:ioaon_mobile/stores/theme/theme_store.dart';
import 'package:ioaon_mobile/utils/device/device_utils.dart';
import 'package:ioaon_mobile/utils/locale/app_localization.dart';
import 'package:ioaon_mobile/widgets/app_icon_widget.dart';
import 'package:ioaon_mobile/widgets/empty_app_bar_widget.dart';
import 'package:ioaon_mobile/widgets/ioaon/button/button_ok_widget.dart';
import 'package:ioaon_mobile/widgets/ioaon/text_input_widget.dart';
import 'package:ioaon_mobile/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ioaon_mobile/widgets/ioaon/display_error_message_widget.dart';
import 'package:ioaon_mobile/widgets/ioaon/text_link_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text controllers:-----------------------------------------------------------
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //stores:---------------------------------------------------------------------
  late ThemeStore _themeStore;

  //focus node:-----------------------------------------------------------------
  late FocusNode _passwordFocusNode;

  //stores:---------------------------------------------------------------------
  final _store = FormStore();

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
      child: Stack(
        children: <Widget>[
          Center(child: _buildMobileLayout()),
          Observer(
            builder: (context) {
              return _store.success
                  ? navigate(context)
                  : DisplayErrorMessageWidget(message: _store.errorStore.errorMessage);
            },
          ),
          Observer(
            builder: (context) {
              return Visibility(
                visible: _store.loading,
                child: CustomProgressIndicatorWidget(),
              );
            },
          )
        ],
      ),
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
            AppIconWidget(image: 'assets/icons/ic_appicon.png'),
            SizedBox(height: 24.0),
            _buildUserIdField(),
            _buildPasswordField(),
            Row(
              children: [
                Expanded(flex: 5, child: _buildSignUpButton()),
                Expanded(flex: 5, child: _buildForgotPasswordButton()),
              ],
            ),
            _buildSignInButton(),
            _buildGoogleSignInButton(),
            _buildFacebookSignInButton()
          ],
        ),
      ),
    );
  }

  Widget _buildUserIdField() {
    return Observer(
      builder: (context) {
        return TextInputWidget(
              hint: AppLocalizations.of(context).translate('login_et_user_email'),
              inputType: TextInputType.emailAddress,
              icon: Icons.person,
              isDarkMode: _themeStore.darkMode,
              textController: _userEmailController,
              inputAction: TextInputAction.next,
              onChanged: (value) {
                _store.setUserId(_userEmailController.text);
              },
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(_passwordFocusNode);
              },
              errorText: _store.formErrorStore.userEmail);
      },
    );
  }

  Widget _buildPasswordField() {
    return Observer(
      builder: (context) {
        return TextInputWidget(
            hint: AppLocalizations.of(context).translate('login_et_user_password'),
            inputType: TextInputType.emailAddress,
            icon: Icons.lock,
            isDarkMode: _themeStore.darkMode,
            textController: _passwordController,
            onChanged: (value) {
              _store.setPassword(_passwordController.text);
            },
            errorText: _store.formErrorStore.password,
            isObscure: true,
            focusNode: _passwordFocusNode);
      },
    );
  }

  Widget _buildSignUpButton() {
    return TextLinkWidget(
        text: AppLocalizations.of(context).translate('login_btn_signup'),
        alignment: FractionalOffset.center,
        onPressed: () {}
    );
  }

  Widget _buildForgotPasswordButton() {
    return TextLinkWidget(
        text: AppLocalizations.of(context).translate('login_btn_forgot_password'),
        alignment: FractionalOffset.center,
        onPressed: () {}
    );
  }

  Widget _buildSignInButton() {
    return ButtonOkWidget(
      text: AppLocalizations.of(context).translate('login_btn_sign_in'),
      onPressed: () async {
        gotoRoute(context, Routes.mainMenu);
        // if (_store.canLogin) {
        //   DeviceUtils.hideKeyboard(context);
        //   _store.login();
        // } else {
        //   DisplayErrorMessageWidget(message: 'Please fill in all fields');
        // }
      },
    );
  }

  Widget _buildGoogleSignInButton() {
    return ButtonOkWidget(
      text: AppLocalizations.of(context).translate('login_btn_google_sign_in'),
      onPressed: () async {
        if (_store.canLogin) {
          DeviceUtils.hideKeyboard(context);
          _store.login();
        } else {
          DisplayErrorMessageWidget(message: 'Please fill in all fields');
        }
      },
    );
  }

  Widget _buildFacebookSignInButton() {
    return ButtonOkWidget(
      text: AppLocalizations.of(context).translate('login_btn_facebook_sign_in'),
      onPressed: () async {
        if (_store.canLogin) {
          DeviceUtils.hideKeyboard(context);
          _store.login();
        } else {
          DisplayErrorMessageWidget(message: 'Please fill in all fields');
        }
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
    _userEmailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}
