class AccountType {
  int? id;
  String? nameTh;
  String? nameEn;

  AccountType({
    this.id,
    this.nameTh,
    this.nameEn,
  });

  factory AccountType.fromMap(Map<String, dynamic> json) => AccountType(
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
