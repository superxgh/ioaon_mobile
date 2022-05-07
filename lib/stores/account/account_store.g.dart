// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AccountStore on _AccountStore, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_AccountStore.isLoading'))
          .value;

  final _$successAtom = Atom(name: '_AccountStore.success');

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  final _$signinFutureAtom = Atom(name: '_AccountStore.signinFuture');

  @override
  ObservableFuture<bool> get signinFuture {
    _$signinFutureAtom.reportRead();
    return super.signinFuture;
  }

  @override
  set signinFuture(ObservableFuture<bool> value) {
    _$signinFutureAtom.reportWrite(value, super.signinFuture, () {
      super.signinFuture = value;
    });
  }

  final _$userEmailAtom = Atom(name: '_AccountStore.userEmail');

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

  final _$_AccountStoreActionController =
      ActionController(name: '_AccountStore');

  @override
  void setUserId(String value) {
    final _$actionInfo = _$_AccountStoreActionController.startAction(
        name: '_AccountStore.setUserId');
    try {
      return super.setUserId(value);
    } finally {
      _$_AccountStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
success: ${success},
signinFuture: ${signinFuture},
userEmail: ${userEmail},
isLoading: ${isLoading}
    ''';
  }
}
