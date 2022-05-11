

import 'account.dart';

class AccountList {
  List<AccountItem>? _accountItems;

//<editor-fold desc="Data Methods">


  AccountList({
    required List<AccountItem>? accountItems,
  }) : _accountItems = accountItems;

// Ac@override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is AccountList &&
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


  AccountList copyWith({
    List<AccountItem>? accountItems,
  }) {
    return AccountList(
      accountItems: accountItems ?? this._accountItems,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'accountItems': this._accountItems,
    };
  }

  factory AccountList.fromMap(List<Map<String, dynamic>> map) {
    List<AccountItem> accountItems = <AccountItem>[];
    accountItems = map.map((accountItem) => AccountItem.fromMap(accountItem)).toList();
    return AccountList(
    accountItems: accountItems,
    );
  }

}
