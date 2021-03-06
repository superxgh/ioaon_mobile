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

  final _$fetchFutureAtom = Atom(name: '_AccountStore.fetchFuture');

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

  final _$currentPageAtom = Atom(name: '_AccountStore.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$nextPageAtom = Atom(name: '_AccountStore.nextPage');

  @override
  bool get nextPage {
    _$nextPageAtom.reportRead();
    return super.nextPage;
  }

  @override
  set nextPage(bool value) {
    _$nextPageAtom.reportWrite(value, super.nextPage, () {
      super.nextPage = value;
    });
  }

  final _$accountItemListAtom = Atom(name: '_AccountStore.accountItemList');

  @override
  ObservableList<AccountItem> get accountItemList {
    _$accountItemListAtom.reportRead();
    return super.accountItemList;
  }

  @override
  set accountItemList(ObservableList<AccountItem> value) {
    _$accountItemListAtom.reportWrite(value, super.accountItemList, () {
      super.accountItemList = value;
    });
  }

  final _$createAccountItemAsyncAction =
      AsyncAction('_AccountStore.createAccountItem');

  @override
  Future<void> createAccountItem(
      AccountGroup accountGroup, AccountItem accountItem) {
    return _$createAccountItemAsyncAction
        .run(() => super.createAccountItem(accountGroup, accountItem));
  }

  final _$getAccountItemListAsyncAction =
      AsyncAction('_AccountStore.getAccountItemList');

  @override
  Future<void> getAccountItemList({bool? first, required AccountGroup group}) {
    return _$getAccountItemListAsyncAction
        .run(() => super.getAccountItemList(first: first, group: group));
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
fetchFuture: ${fetchFuture},
userEmail: ${userEmail},
currentPage: ${currentPage},
nextPage: ${nextPage},
accountItemList: ${accountItemList},
isLoading: ${isLoading}
    ''';
  }
}
