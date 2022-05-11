

import 'dart:developer';

import 'package:flutter/material.dart';

import 'account.dart';

class AccountItemList {
  List<AccountItem>? _accountItems;

//<editor-fold desc="Data Methods">


  AccountItemList({
    required List<AccountItem>? accountItems,
  }) : _accountItems = accountItems;

// Ac@override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is AccountItemList &&
              runtimeType == other.runtimeType &&
              _accountItems == other._accountItems
          );


  @override
  int get hashCode =>
      _accountItems.hashCode;


  @override
  String toString() {
    return 'AccountList{' +
        ' _accountItems: $_accountItems,' +
        '}';
  }


  AccountItemList copyWith({
    List<AccountItem>? accountItems,
  }) {
    return AccountItemList(
      accountItems: accountItems ?? this._accountItems,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'accountItems': this._accountItems,
    };
  }

  factory AccountItemList.fromMap(List<dynamic> map) {
    List<AccountItem> accountItems = <AccountItem>[];
    // log('map = ${map.length}');
    accountItems = map.map((e) => AccountItem.fromMap(e)).toList();
    // log('accountItems = ${accountItems.length}');
    return AccountItemList(
        accountItems: accountItems
    );
  }

  factory AccountItemList.empty() {
    return AccountItemList(
        accountItems: []
    );
  }

  List<AccountItem>? get accountItems => _accountItems;

  List<DataColumn> get tableHeader => [
    DataColumn(
      label: Text(
        'Date',
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
    ),
    DataColumn(
      label: Text(
        'Type',
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
    ),
    DataColumn(
      label: Text(
        'Code',
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
    ),
    DataColumn(
      label: Text(
        'Amount',
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
    ),
  ];

  void append(AccountItemList accountItemList){
    _accountItems!.addAll(accountItemList.accountItems!);
  }


}
