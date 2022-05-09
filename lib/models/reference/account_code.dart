class AccountCode {
  int? id;
  String? nameTh;
  String? nameEn;

  AccountCode({
    this.id,
    this.nameTh,
    this.nameEn,
  });

  factory AccountCode.fromMap(Map<String, dynamic> json) => AccountCode(
    id: json["id"],
    nameTh: json["nameTh"],
    nameEn: json["nameEn"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "nameTh": nameTh,
    "nameEn": nameEn,
  };

}
