import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ioaon_mobile/constants/ioaon_global.dart';
import 'package:ioaon_mobile/widgets/ioaon/ioaon_logo.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/sharedpref/constants/preferences.dart';
import '../../../utils/tools/logging.dart';
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
import '../../../widgets/progress_indicator_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>  {
  
  final log = logger(SignUpScreen);
  
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
    log.i('initState()');
    _passwordFocusNode = FocusNode();
  }

  @override
  void didChangeDependencies() {
    log.i('didChangeDependencies()');
    super.didChangeDependencies();
    _themeStore = Provider.of<ThemeStore>(context);
    _userStore = Provider.of<UserStore>(context);

    log.i('didChangeDependencies() _userStore.success = ${_userStore.success}');
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
              log.d('_buildBody() _userStore.success = ${_userStore.success}');
              return _userStore.success
                  ? gotoRoute(context, Routes.signin)
                  : displayErrorMessage(context,_userStore.errorStore.errorMessage);
            },
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
            // _buildSignUpWithGoogleButton()
          ],
        ),
      ),
    );
  }

  Widget _buildFullNameField() {
    log.i('_buildFullNameField()');
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
    log.i('_buildMobileNumberField()');
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
    log.i('_buildEmailField()');
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
    log.i('_buildPasswordField()');
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
    log.i('_buildConfirmPasswordField()');
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
    log.i('_buildSignUpButton()');
    return ButtonOkWidget(
          text: AppLocalizations.of(context).translate('common_save'),
          onPressed: () async {
            log.d('_buildSignUpButton _form.canSave = ${_form.canSave}');
            if (_form.canSave) {
              DeviceUtils.hideKeyboard(context);
              log.d('_form.userData = ${_form.userData}');
              User user = User.fromCreateUserByEmailMap(_form.userData);
              log.d('user.toCreateUserByEmailMap() = ${user.toCreateUserByEmailMap()}');
              await _userStore.signup(user.toCreateUserByEmailMap()).catchError((e) {
                displayErrorMessage(context, _userStore.errorStore.errorMessage);
              });
            } else {
              displayErrorMessage( context, 'error_please_fill_in_all_fields');
            }
          },
        );
  }

  Widget _buildSignUpWithGoogleButton() {
    log.i('_buildSignUpWithGoogleButton()');
    return ButtonOkWidget(
      text: AppLocalizations.of(context).translate('common_google'),
      onPressed: () async {
      },
    );
  }


  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    log.i('dispose()');
    // Clean up the controller when the Widget is removed from the Widget tree
    _form.dispose();
    _userStore.dispose();
    _fullNameController.dispose();
    super.dispose();
  }
}
