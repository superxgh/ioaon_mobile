// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ForgotPasswordForm on _ForgotPasswordForm, Store {
  Computed<bool>? _$canSendComputed;

  @override
  bool get canSend => (_$canSendComputed ??= Computed<bool>(() => super.canSend,
          name: '_ForgotPasswordForm.canSend'))
      .value;
  Computed<Map<String, dynamic>>? _$dataComputed;

  @override
  Map<String, dynamic> get data =>
      (_$dataComputed ??= Computed<Map<String, dynamic>>(() => super.data,
              name: '_ForgotPasswordForm.data'))
          .value;

  final _$emailAtom = Atom(name: '_ForgotPasswordForm.email');

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

  final _$_ForgotPasswordFormActionController =
      ActionController(name: '_ForgotPasswordForm');

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_ForgotPasswordFormActionController.startAction(
        name: '_ForgotPasswordForm.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_ForgotPasswordFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$_ForgotPasswordFormActionController.startAction(
        name: '_ForgotPasswordForm.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_ForgotPasswordFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
canSend: ${canSend},
data: ${data}
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

  @override
  String toString() {
    return '''
email: ${email},
hasErrorsInForm: ${hasErrorsInForm}
    ''';
  }
}
