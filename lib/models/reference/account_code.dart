class AccountCode {
  int? code;
  String? nameTh;
  String? nameEn;

  AccountCode({
    this.code,
    this.nameTh,
    this.nameEn,
  });

  factory AccountCode.fromMap(Map<String, dynamic> json) => AccountCode(
    code: json["code"],
    nameTh: json["nameTh"],
    nameEn: json["nameEn"],
  );

  Map<String, dynamic> toMap() => {
    "code": code,
    "nameTh": nameTh,
    "nameEn": nameEn,
  };

}
