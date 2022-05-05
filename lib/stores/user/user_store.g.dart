// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading => (_$isLoadingComputed ??=
          Computed<bool>(() => super.isLoading, name: '_UserStore.isLoading'))
      .value;

  final _$successAtom = Atom(name: '_UserStore.success');

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

  final _$signinFutureAtom = Atom(name: '_UserStore.signinFuture');

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

  final _$signinAsyncAction = AsyncAction('_UserStore.signin');

  @override
  Future<dynamic> signin(String email, String password) {
    return _$signinAsyncAction.run(() => super.signin(email, password));
  }

  @override
  String toString() {
    return '''
success: ${success},
signinFuture: ${signinFuture},
isLoading: ${isLoading}
    ''';
  }
}
