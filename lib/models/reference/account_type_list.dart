

import 'account_type.dart';

class AccountTypeList {
  List<AccountType>? _accountTypes;

  AccountTypeList({
    required List<AccountType>? accountTypes,
  }) : _accountTypes = accountTypes;

  factory AccountTypeList.fromJson(List<dynamic> json) {
    List<AccountType> accountTypes = <AccountType>[];
    accountTypes = json.map((accountType) => AccountType.fromMap(accountType)).toList();

    return AccountTypeList(
      accountTypes: accountTypes,
    );
  }

  factory AccountTypeList.empty() {
    return AccountTypeList(
      accountTypes: [],
    );
  }

  @override
  String toString() {
    return 'AccountTypeList{accountTypes: $_accountTypes}';
  }

  List<AccountType>? get accountTypes => _accountTypes;
}