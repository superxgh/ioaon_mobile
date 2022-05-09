
import 'account_code.dart';

class AccountCodeList {
  final List<AccountCode>? accountCodes;

  AccountCodeList({
    this.accountCodes,
  });

  factory AccountCodeList.fromJson(List<dynamic> json) {
    List<AccountCode> accountCodes = <AccountCode>[];
    accountCodes = json.map((accountCode) => AccountCode.fromMap(accountCode)).toList();

    return AccountCodeList(
      accountCodes: accountCodes,
    );
  }

  factory AccountCodeList.empty() {
    return AccountCodeList(
      accountCodes: [],
    );
  }

}
