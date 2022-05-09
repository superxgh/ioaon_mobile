
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

  @override
  String toString() {
    String ret =   '\naccountCodes length = ${(accountCodes ?? []).length}';
    (accountCodes ?? []).forEach((e) {
      ret += '\n id = ${e.code},  nameTh = ${e.nameTh},  nameEn = ${e.nameEn}  ';
    });
    return ret;
  }

  List<Map<String,dynamic>> toDropDownList(String? language) {
    List<Map<String,dynamic>> list = [];
    if (accountCodes == null) return [];
    list = accountCodes!
        .map((e) => {
          "code": e.code,
          "name":  ((language ?? 'th_TH') == 'th_TH') ? e.nameTh : e.nameEn
        }).toList();

    return list;
  }

}
