import 'package:ioaon_mobile/data/sharedpref/constants/preferences.dart';
import 'package:ioaon_mobile/stores/user/user_store.dart';
import 'package:ioaon_mobile/utils/navigator/navigator_tools.dart';
import 'package:ioaon_mobile/utils/routes/routes.dart';
import 'package:ioaon_mobile/stores/theme/theme_store.dart';
import 'package:ioaon_mobile/utils/device/device_utils.dart';
import 'package:ioaon_mobile/utils/locale/app_localization.dart';
import 'package:ioaon_mobile/widgets/empty_app_bar_widget.dart';
import 'package:ioaon_mobile/widgets/ioaon/button/button_ok_widget.dart';
import 'package:ioaon_mobile/widgets/ioaon/text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ioaon_mobile/widgets/ioaon/text_link_widget.dart';
import '../../../constants/ioaon_global.dart';
import '../../../utils/tools/logging.dart';
import '../../../stores/user/signin_form.dart';
import '../../../utils/errors/error_tools.dart';
import '../../../widgets/ioaon/ioaon_logo.dart';
import '../../../widgets/progress_indicator_widget.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final log = logger(SignInScreen);
  //text controllers:-----------------------------------------------------------
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //stores:---------------------------------------------------------------------
  late ThemeStore _themeStore;
  late UserStore _userStore;

  //focus node:-----------------------------------------------------------------
  late FocusNode _passwordFocusNode;

  //stores:---------------------------------------------------------------------
  final _form = SignInForm();

  @override
  void initState() {
    super.initState();
    log.i('initState()');
    _passwordFocusNode = FocusNode();
  }

  @override
  void didChangeDependencies() {
    log.i('didChangeDependencies()');
    super.didChangeDependencies();
    _themeStore = Provider.of<ThemeStore>(context);
    _userStore = Provider.of<UserStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    log.i('build()');
    return Scaffold(
      primary: true,
      appBar: EmptyAppBar(),
      body: _buildBody(),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    log.i('_buildBody()');
    return Material(
      child: Stack(
        children: <Widget>[
          Center(child: _buildMobileLayout()),
          Observer(
            builder: (context) {
              return _userStore.success
                  ? navigate(context)
                  :  displayErrorMessage(context,_userStore.errorStore.errorMessage);
            }
          ),
          Observer(
            builder: (context) {
              return Visibility(
                visible: _userStore.isLoading,
                child: CustomProgressIndicatorWidget(text: 'Connect to backend.',),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    log.i('_buildMobileLayout()');
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconOnTabWidget(
              imagePath: ioaonConfig['logo'],
              onTap: () { } ,
            ),
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
            // _buildGoogleSignInButton(),
            // _buildFacebookSignInButton()
          ],
        ),
      ),
    );
  }

  Widget _buildUserIdField() {
    log.i('_buildUserIdField()');
    return Observer(
      builder: (context) {
        return TextInputWidget(
              hint: AppLocalizations.of(context).translate('signin_et_user_email'),
              inputType: TextInputType.emailAddress,
              icon: Icons.person,
              isDarkMode: _themeStore.darkMode,
              textController: _userEmailController,
              inputAction: TextInputAction.next,
              onChanged: (value) {
                _form.setUseEmail(_userEmailController.text);
              },
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(_passwordFocusNode);
              },
              errorText: _form.formErrorStore.userEmail);
      },
    );
  }

  Widget _buildPasswordField() {
    log.i('_buildPasswordField()');
    return Observer(
      builder: (context) {
        return TextInputWidget(
            hint: AppLocalizations.of(context).translate('signin_et_user_password'),
            inputType: TextInputType.emailAddress,
            icon: Icons.lock,
            isDarkMode: _themeStore.darkMode,
            textController: _passwordController,
            onChanged: (value) {
              _form.setPassword(_passwordController.text);
            },
            errorText: _form.formErrorStore.password,
            isObscure: true,
            focusNode: _passwordFocusNode);
      },
    );
  }

  Widget _buildSignUpButton() {
    log.i('_buildSignUpButton()');
    return TextLinkWidget(
        text: AppLocalizations.of(context).translate('signin_btn_signup'),
        alignment: FractionalOffset.center,
        onPressed: () {
          gotoRoute(context, Routes.signUp);
        }
    );
  }

  Widget _buildForgotPasswordButton() {
    log.i('_buildForgotPasswordButton()');
    return TextLinkWidget(
        text: AppLocalizations.of(context).translate('signin_btn_forgot_password'),
        alignment: FractionalOffset.center,
        onPressed: () {
          gotoRoute(context, Routes.forgotPassword);
        }
    );
  }

  Widget _buildSignInButton() {
    log.i('_buildSignInButton()');
    return ButtonOkWidget(
      text: AppLocalizations.of(context).translate('signin_btn_sign_in'),
      onPressed: () async {
        // gotoRoute(context, Routes.mainMenu);
        log.w('_buildSignInButton() _form.canSignin = ${_form.canSignin}');
        if (_form.canSignin) {
          DeviceUtils.hideKeyboard(context);
          log.w('_buildSignInButton() _form.userEmailAndPassword = ${_form.userEmailAndPassword}');
          await _userStore.signin(_form.userEmailAndPassword)
              .then((res) {
                log.w('_buildSignInButton() signin - success');
              })
              .catchError((e) {
                log.w('_buildSignInButton() error = ${_userStore.errorStore.errorMessage}');
                displayErrorMessage(context,_userStore.errorStore.errorMessage);
              });
        } else {
          displayErrorMessage(context,'Please fill in all fields');
        }
      },
    );
  }

  Widget _buildGoogleSignInButton() {
    log.i('_buildGoogleSignInButton()');
    return ButtonOkWidget(
      text: AppLocalizations.of(context).translate('common_google'),
      onPressed: () async {
        if (_form.canSignin) {
          DeviceUtils.hideKeyboard(context);
          // _form.signin();
        } else {
          displayErrorMessage(context,'Please fill in all fields');
        }
      },
    );
  }

  Widget _buildFacebookSignInButton() {
    log.i('_buildFacebookSignInButton()');
    return ButtonOkWidget(
      text: AppLocalizations.of(context).translate('common_facebook'),
      onPressed: () async {
        if (_form.canSignin) {
          DeviceUtils.hideKeyboard(context);
          // _form.signin();
        } else {
          displayErrorMessage(context,'Please fill in all fields');
        }
      },
    );
  }

  Widget navigate(BuildContext context) {
    log.i('navigate()');
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(Preferences.is_logged_in, true);
    });

    log.w('goto main menu');
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
