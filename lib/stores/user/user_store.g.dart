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

  final _$fetchFutureAtom = Atom(name: '_UserStore.fetchFuture');

  @override
  ObservableFuture<dynamic> get fetchFuture {
    _$fetchFutureAtom.reportRead();
    return super.fetchFuture;
  }

  @override
  set fetchFuture(ObservableFuture<dynamic> value) {
    _$fetchFutureAtom.reportWrite(value, super.fetchFuture, () {
      super.fetchFuture = value;
    });
  }

  final _$currentUserAtom = Atom(name: '_UserStore.currentUser');

  @override
  User get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(User value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  final _$initIsLoggedInAndAuthTokenAsyncAction =
      AsyncAction('_UserStore.initIsLoggedInAndAuthToken');

  @override
  Future<void> initIsLoggedInAndAuthToken() {
    return _$initIsLoggedInAndAuthTokenAsyncAction
        .run(() => super.initIsLoggedInAndAuthToken());
  }

  final _$signupAsyncAction = AsyncAction('_UserStore.signup');

  @override
  Future<void> signup(dynamic data) {
    return _$signupAsyncAction.run(() => super.signup(data));
  }

  final _$signinAsyncAction = AsyncAction('_UserStore.signin');

  @override
  Future<void> signin(dynamic data) {
    return _$signinAsyncAction.run(() => super.signin(data));
  }

  @override
  String toString() {
    return '''
success: ${success},
fetchFuture: ${fetchFuture},
currentUser: ${currentUser},
isLoading: ${isLoading}
    ''';
  }
}
