import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ioaon_mobile/constants/ioaon_global.dart';
import 'package:ioaon_mobile/widgets/ioaon/ioaon_logo.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/sharedpref/constants/preferences.dart';
import '../../../models/user/user.dart';
import '../../../stores/theme/theme_store.dart';
import '../../../stores/user/signup_form.dart';
import '../../../stores/user/user_store.dart';
import '../../../utils/device/device_utils.dart';
import '../../../utils/errors/error_tools.dart';
import '../../../utils/locale/app_localization.dart';
import '../../../utils/navigator/navigator_tools.dart';
import '../../../utils/routes/routes.dart';
import '../../../widgets/empty_app_bar_widget.dart';
import '../../../widgets/ioaon/button/button_ok_widget.dart';
import '../../../widgets/ioaon/text_input_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>  {
  //text controllers:-----------------------------------------------------------
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  //stores:---------------------------------------------------------------------
  late ThemeStore _themeStore;
  late UserStore _userStore;

  //focus node:-----------------------------------------------------------------
  late FocusNode _passwordFocusNode;

  //stores:---------------------------------------------------------------------
  final _form = SignUpForm();

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeStore = Provider.of<ThemeStore>(context);
    _userStore = Provider.of<UserStore>(context);
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
                    AppLocalizations.of(context).translate('signup_header'),
                  style: TextStyle(fontSize: 30.0),
                )
            ),
            SizedBox(height: 24.0),
            _buildFullNameField(),
            _buildMobileNumberField(),
            _buildEmailField(),
            _buildPasswordField(),
            _buildConfirmPasswordField(),
            SizedBox(height: 24.0),
            _buildSignUpButton(),
            _buildSignUpWithGoogleButton()
          ],
        ),
      ),
    );
  }

  Widget _buildFullNameField() {
    return Observer(
      builder: (context) {
        return TextInputWidget(
            hint: AppLocalizations.of(context).translate('signup_full_name'),
            inputType: TextInputType.text,
            icon: Icons.person,
            isDarkMode: _themeStore.darkMode,
            textController: _fullNameController,
            inputAction: TextInputAction.next,
            onChanged: (value) {
              _form.setFullName(_fullNameController.text);
            },
            onFieldSubmitted: (value) {
              // FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
            errorText: _form.formErrorStore.fullName);
      },
    );
  }

  Widget _buildMobileNumberField() {
    return Observer(
      builder: (context) {
        return TextInputWidget(
            hint: AppLocalizations.of(context).translate('signup_mobile_number'),
            inputType: TextInputType.text,
            icon: Icons.phone_android,
            isDarkMode: _themeStore.darkMode,
            textController: _mobileNumberController,
            inputAction: TextInputAction.next,
            onChanged: (value) {
              _form.setMobileNumber(_mobileNumberController.text);
            },
            onFieldSubmitted: (value) {
              // FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
            errorText: _form.formErrorStore.mobileNumber);
      },
    );
  }

  Widget _buildEmailField() {
    return Observer(
      builder: (context) {
        return TextInputWidget(
            hint: AppLocalizations.of(context).translate('signup_email'),
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

  Widget _buildPasswordField() {
    return Observer(
      builder: (context) {
        return TextInputWidget(
            hint: AppLocalizations.of(context).translate('signup_password'),
            inputType: TextInputType.text,
            icon: Icons.vpn_key_sharp,
            isDarkMode: _themeStore.darkMode,
            textController: _passwordController,
            inputAction: TextInputAction.next,
            onChanged: (value) {
              _form.setPassword(_passwordController.text);
            },
            onFieldSubmitted: (value) {
              // FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
            errorText: _form.formErrorStore.password);
      },
    );
  }

  Widget _buildConfirmPasswordField() {
    return Observer(
      builder: (context) {
        return TextInputWidget(
            hint: AppLocalizations.of(context).translate('signup_confirm_password'),
            inputType: TextInputType.text,
            icon: Icons.vpn_key_sharp,
            isDarkMode: _themeStore.darkMode,
            textController: _confirmPasswordController,
            inputAction: TextInputAction.next,
            onChanged: (value) {
              _form.setConfirmPassword(_confirmPasswordController.text);
            },
            onFieldSubmitted: (value) {
              // FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
            errorText: _form.formErrorStore.confirmPassword);
      },
    );
  }

  Widget _buildSignUpButton() {
    return ButtonOkWidget(
      text: AppLocalizations.of(context).translate('common_save'),
      onPressed: () async {
        log('_buildSignUpButton _form.canSave = ${_form.canSave}', name: 'SignUpScreen');
        if (_form.canSave) {
          DeviceUtils.hideKeyboard(context);
          log('_form.userData = ${_form.userData}', name: 'SignUpScreen');
          User user = User.fromCreateUserByEmailMap(_form.userData);
          log('user.toCreateUserByEmailMap() = ${user.toCreateUserByEmailMap()}', name: 'SignUpScreen');
          await _userStore.signup(user).catchError((e) {
            displayErrorMessage(context, _userStore.errorStore.errorMessage);
          });
          // _store.signin();
          // gotoRoute(context, Routes.mainMenu);
          //
        } else {
          displayErrorMessage( context, 'error_please_fill_in_all_fields');
        }
      },
    );
  }

  Widget _buildSignUpWithGoogleButton() {
    return ButtonOkWidget(
      text: AppLocalizations.of(context).translate('common_google'),
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
