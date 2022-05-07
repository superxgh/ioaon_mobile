// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignInForm on _SignInForm, Store {
  Computed<bool>? _$canSigninComputed;

  @override
  bool get canSignin => (_$canSigninComputed ??=
          Computed<bool>(() => super.canSignin, name: '_SignInForm.canSignin'))
      .value;

  final _$userEmailAtom = Atom(name: '_SignInForm.userEmail');

  @override
  String get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  final _$passwordAtom = Atom(name: '_SignInForm.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$_SignInFormActionController = ActionController(name: '_SignInForm');

  @override
  void setUseEmail(String value) {
    final _$actionInfo = _$_SignInFormActionController.startAction(
        name: '_SignInForm.setUseEmail');
    try {
      return super.setUseEmail(value);
    } finally {
      _$_SignInFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_SignInFormActionController.startAction(
        name: '_SignInForm.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_SignInFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUserEmail(String value) {
    final _$actionInfo = _$_SignInFormActionController.startAction(
        name: '_SignInForm.validateUserEmail');
    try {
      return super.validateUserEmail(value);
    } finally {
      _$_SignInFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_SignInFormActionController.startAction(
        name: '_SignInForm.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_SignInFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userEmail: ${userEmail},
password: ${password},
canSignin: ${canSignin}
    ''';
  }
}

mixin _$FormErrorStore on _FormErrorStore, Store {
  Computed<bool>? _$hasErrorsInSigninComputed;

  @override
  bool get hasErrorsInSignin => (_$hasErrorsInSigninComputed ??= Computed<bool>(
          () => super.hasErrorsInSignin,
          name: '_FormErrorStore.hasErrorsInSignin'))
      .value;

  final _$userEmailAtom = Atom(name: '_FormErrorStore.userEmail');

  @override
  String? get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String? value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  final _$passwordAtom = Atom(name: '_FormErrorStore.password');

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  @override
  String toString() {
    return '''
userEmail: ${userEmail},
password: ${password},
hasErrorsInSignin: ${hasErrorsInSignin}
    ''';
  }
}
