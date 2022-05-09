

import 'account.dart';

class AccountList {
  final List<AccountItem>? accountItems;

  AccountList({
    this.accountItems,
  });

  factory AccountList.fromJson(List<dynamic> json) {
    List<AccountItem> accountItems = <AccountItem>[];
    accountItems = json.map((accountItem) => AccountItem.fromMap(accountItem)).toList();

    return AccountList(
      accountItems: accountItems,
    );
  }
}
