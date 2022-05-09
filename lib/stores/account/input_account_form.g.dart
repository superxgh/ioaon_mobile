// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_account_form.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InputAccountForm on _InputAccountForm, Store {
  Computed<bool>? _$canSaveComputed;

  @override
  bool get canSave => (_$canSaveComputed ??= Computed<bool>(() => super.canSave,
          name: '_InputAccountForm.canSave'))
      .value;
  Computed<AccountItem>? _$toAccountItemComputed;

  @override
  AccountItem get toAccountItem => (_$toAccountItemComputed ??=
          Computed<AccountItem>(() => super.toAccountItem,
              name: '_InputAccountForm.toAccountItem'))
      .value;

  final _$accountTypeAtom = Atom(name: '_InputAccountForm.accountType');

  @override
  int get accountType {
    _$accountTypeAtom.reportRead();
    return super.accountType;
  }

  @override
  set accountType(int value) {
    _$accountTypeAtom.reportWrite(value, super.accountType, () {
      super.accountType = value;
    });
  }

  final _$accountCodeAtom = Atom(name: '_InputAccountForm.accountCode');

  @override
  int get accountCode {
    _$accountCodeAtom.reportRead();
    return super.accountCode;
  }

  @override
  set accountCode(int value) {
    _$accountCodeAtom.reportWrite(value, super.accountCode, () {
      super.accountCode = value;
    });
  }

  final _$accountAmountAtom = Atom(name: '_InputAccountForm.accountAmount');

  @override
  double get accountAmount {
    _$accountAmountAtom.reportRead();
    return super.accountAmount;
  }

  @override
  set accountAmount(double value) {
    _$accountAmountAtom.reportWrite(value, super.accountAmount, () {
      super.accountAmount = value;
    });
  }

  final _$_InputAccountFormActionController =
      ActionController(name: '_InputAccountForm');

  @override
  void setAccountType(int value) {
    final _$actionInfo = _$_InputAccountFormActionController.startAction(
        name: '_InputAccountForm.setAccountType');
    try {
      return super.setAccountType(value);
    } finally {
      _$_InputAccountFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAccountCode(int value) {
    final _$actionInfo = _$_InputAccountFormActionController.startAction(
        name: '_InputAccountForm.setAccountCode');
    try {
      return super.setAccountCode(value);
    } finally {
      _$_InputAccountFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAccountAmount(double value) {
    final _$actionInfo = _$_InputAccountFormActionController.startAction(
        name: '_InputAccountForm.setAccountAmount');
    try {
      return super.setAccountAmount(value);
    } finally {
      _$_InputAccountFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateAccountType(int value) {
    final _$actionInfo = _$_InputAccountFormActionController.startAction(
        name: '_InputAccountForm.validateAccountType');
    try {
      return super.validateAccountType(value);
    } finally {
      _$_InputAccountFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateAccountCode(int value) {
    final _$actionInfo = _$_InputAccountFormActionController.startAction(
        name: '_InputAccountForm.validateAccountCode');
    try {
      return super.validateAccountCode(value);
    } finally {
      _$_InputAccountFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateAccountAmount(double value) {
    final _$actionInfo = _$_InputAccountFormActionController.startAction(
        name: '_InputAccountForm.validateAccountAmount');
    try {
      return super.validateAccountAmount(value);
    } finally {
      _$_InputAccountFormActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
accountType: ${accountType},
accountCode: ${accountCode},
accountAmount: ${accountAmount},
canSave: ${canSave},
toAccountItem: ${toAccountItem}
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

  final _$accountTypeAtom = Atom(name: '_FormErrorStore.accountType');

  @override
  String? get accountType {
    _$accountTypeAtom.reportRead();
    return super.accountType;
  }

  @override
  set accountType(String? value) {
    _$accountTypeAtom.reportWrite(value, super.accountType, () {
      super.accountType = value;
    });
  }

  final _$accountCodeAtom = Atom(name: '_FormErrorStore.accountCode');

  @override
  String? get accountCode {
    _$accountCodeAtom.reportRead();
    return super.accountCode;
  }

  @override
  set accountCode(String? value) {
    _$accountCodeAtom.reportWrite(value, super.accountCode, () {
      super.accountCode = value;
    });
  }

  final _$accountAmountAtom = Atom(name: '_FormErrorStore.accountAmount');

  @override
  String? get accountAmount {
    _$accountAmountAtom.reportRead();
    return super.accountAmount;
  }

  @override
  set accountAmount(String? value) {
    _$accountAmountAtom.reportWrite(value, super.accountAmount, () {
      super.accountAmount = value;
    });
  }

  @override
  String toString() {
    return '''
accountType: ${accountType},
accountCode: ${accountCode},
accountAmount: ${accountAmount},
hasErrorsInForm: ${hasErrorsInForm}
    ''';
  }
}
