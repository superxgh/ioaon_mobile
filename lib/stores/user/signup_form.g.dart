// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpForm on _SignUpForm, Store {
  Computed<bool>? _$canSaveComputed;

  @override
  bool get canSave => (_$canSaveComputed ??=
          Computed<bool>(() => super.canSave, name: '_SignUpForm.canSave'))
      .value;
  Computed<Map<String, dynamic>>? _$userDataComputed;

  @override
  Map<String, dynamic> get userData => (_$userDataComputed ??=
          Computed<Map<String, dynamic>>(() => super.userData,
              name: '_SignUpForm.userData'))
      .value;

  final _$fullNameAtom = Atom(name: '_SignUpForm.fullName');

  @override
  String get fullName {
    _$fullNameAtom.reportRead();
    return super.fullName;
  }

  @override
  set fullName(String value) {
    _$fullNameAtom.reportWrite(value, super.fullName, () {
      super.fullName = value;
    });
  }

  final _$mobileNumberAtom = Atom(name: '_SignUpForm.mobileNumber');

  @override
  String get mobileNumber {
    _$mobileNumberAtom.reportRead();
    return super.mobileNumber;
  }

  @override
  set mobileNumber(String value) {
    _$mobileNumberAtom.reportWrite(value, super.mobileNumber, () {
      super.mobileNumber = value;
    });
  }

  final _$emailAtom = Atom(name: '_SignUpForm.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_SignUpForm.password');

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

  final _$confirmPasswordAtom = Atom(name: '_SignUpForm.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  final _$_SignUpFormActionController = ActionController(name: '_SignUpForm');

  @override
  void setFullName(String value) {
    final _$actionInfo = _$_SignUpFormActionController.startAction(
        name: '_SignUpForm.setFullName');
    try {
      return super.setFullName(value);
    } finally {
      _$_SignUpFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMobileNumber(String value) {
    final _$actionInfo = _$_SignUpFormActionController.startAction(
        name: '_SignUpForm.setMobileNumber');
    try {
      return super.setMobileNumber(value);
    } finally {
      _$_SignUpFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo =
        _$_SignUpFormActionController.startAction(name: '_SignUpForm.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignUpFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_SignUpFormActionController.startAction(
        name: '_SignUpForm.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_SignUpFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$_SignUpFormActionController.startAction(
        name: '_SignUpForm.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_SignUpFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateFullName(String value) {
    final _$actionInfo = _$_SignUpFormActionController.startAction(
        name: '_SignUpForm.validateFullName');
    try {
      return super.validateFullName(value);
    } finally {
      _$_SignUpFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateMobileName(String value) {
    final _$actionInfo = _$_SignUpFormActionController.startAction(
        name: '_SignUpForm.validateMobileName');
    try {
      return super.validateMobileName(value);
    } finally {
      _$_SignUpFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$_SignUpFormActionController.startAction(
        name: '_SignUpForm.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_SignUpFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_SignUpFormActionController.startAction(
        name: '_SignUpForm.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_SignUpFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateConfirmPassword(String value) {
    final _$actionInfo = _$_SignUpFormActionController.startAction(
        name: '_SignUpForm.validateConfirmPassword');
    try {
      return super.validateConfirmPassword(value);
    } finally {
      _$_SignUpFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fullName: ${fullName},
mobileNumber: ${mobileNumber},
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
canSave: ${canSave},
userData: ${userData}
    ''';
  }
}

mixin _$FormErrorStore on _FormErrorStore, Store {
  Computed<bool>? _$hasErrorsInFormComputed;

  @override
  bool get hasErrorsInForm =>
      (_$hasErrorsInFormComputed ??= Computed<bool>(() => super.hasErrorsInForm,
              name: '_FormErrorStore.hasErrorsInForm'))
          .value;

  final _$fullNameAtom = Atom(name: '_FormErrorStore.fullName');

  @override
  String? get fullName {
    _$fullNameAtom.reportRead();
    return super.fullName;
  }

  @override
  set fullName(String? value) {
    _$fullNameAtom.reportWrite(value, super.fullName, () {
      super.fullName = value;
    });
  }

  final _$mobileNumberAtom = Atom(name: '_FormErrorStore.mobileNumber');

  @override
  String? get mobileNumber {
    _$mobileNumberAtom.reportRead();
    return super.mobileNumber;
  }

  @override
  set mobileNumber(String? value) {
    _$mobileNumberAtom.reportWrite(value, super.mobileNumber, () {
      super.mobileNumber = value;
    });
  }

  final _$emailAtom = Atom(name: '_FormErrorStore.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
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

  final _$confirmPasswordAtom = Atom(name: '_FormErrorStore.confirmPassword');

  @override
  String? get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String? value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  @override
  String toString() {
    return '''
fullName: ${fullName},
mobileNumber: ${mobileNumber},
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
hasErrorsInForm: ${hasErrorsInForm}
    ''';
  }
}
