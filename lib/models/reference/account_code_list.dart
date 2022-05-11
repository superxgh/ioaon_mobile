
import 'account_code.dart';

class AccountCodeList {
  final List<AccountCode>? _accountCodes;

  AccountCodeList({
    required List<AccountCode>? accountCodes,
  }) : _accountCodes = accountCodes;

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



  List<Map<String,dynamic>> toDropDownList(String? language) {
    List<Map<String,dynamic>> list = [];
    if (_accountCodes == null) return [];
    list = _accountCodes!
        .map((e) => {
          "code": e.code,
          "name":  ((language ?? 'th_TH') == 'th_TH') ? e.nameTh : e.nameEn
        }).toList();

    return list;
  }

  @override
  String toString() {
    return 'AccountCodeList{_accountCodes: $_accountCodes}';
  }
}
