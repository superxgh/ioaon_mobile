

import 'account_type.dart';

class AccountTypeList {
  final List<AccountType>? accountTypes;

  AccountTypeList({
    this.accountTypes,
  });

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
    String ret =   '\naccountTypes length = ${(accountTypes ?? []).length}';
    (accountTypes ?? []).forEach((e) {
      ret += '\n id = ${e.id},  nameTh = ${e.nameTh},  nameEn = ${e.nameEn}  ';
    });
    return ret;
  }

}