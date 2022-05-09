class AccountItem {
  int? type;
  int? code;
  double? amount;

  AccountItem({
    this.type,
    this.code,
    this.amount
  });

  factory AccountItem.fromMap(Map<String, dynamic> json) => AccountItem(
    type: json["type"] ?? 0,
    code: json["code"] ?? 0,
    amount: json["amount"] ?? 0.0,
  );

  Map<String, dynamic> toMap() => {
    "type": type,
    "code": code,
    "amount": amount,
  };

  @override
  String toString() {
    String ret =   '\nAccountItem { type: $type, code: $code, amount: $amount }';
    return ret;
  }
}
