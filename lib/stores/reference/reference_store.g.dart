// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reference_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReferenceStore on _ReferenceStore, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_ReferenceStore.isLoading'))
          .value;

  final _$successAtom = Atom(name: '_ReferenceStore.success');

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

  final _$fetchFutureAtom = Atom(name: '_ReferenceStore.fetchFuture');

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

  final _$accountTypeListAtom = Atom(name: '_ReferenceStore.accountTypeList');

  @override
  AccountTypeList get accountTypeList {
    _$accountTypeListAtom.reportRead();
    return super.accountTypeList;
  }

  @override
  set accountTypeList(AccountTypeList value) {
    _$accountTypeListAtom.reportWrite(value, super.accountTypeList, () {
      super.accountTypeList = value;
    });
  }

  final _$getAccountTypeListAsyncAction =
      AsyncAction('_ReferenceStore.getAccountTypeList');

  @override
  Future<dynamic> getAccountTypeList() {
    return _$getAccountTypeListAsyncAction
        .run(() => super.getAccountTypeList());
  }

  @override
  String toString() {
    return '''
success: ${success},
fetchFuture: ${fetchFuture},
accountTypeList: ${accountTypeList},
isLoading: ${isLoading}
    ''';
  }
}
