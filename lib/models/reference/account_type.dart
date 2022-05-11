class AccountType {
  int? _id;
  String? _nameTh;
  String? _nameEn;

  AccountType({
    required int? id,
    required String? nameTh,
    required String? nameEn,
  })  : _id = id,
        _nameTh = nameTh,
        _nameEn = nameEn;

  factory AccountType.fromMap(Map<String, dynamic> json) => AccountType(
    id: json["id"],
    nameTh: json["nameTh"],
    nameEn: json["nameEn"],
  );

  Map<String, dynamic> toMap() => {
    "id": _id,
    "nameTh": _nameTh,
    "nameEn": _nameEn,
  };

  int? get id => _id;

  String? get nameEn => _nameEn;

  String? get nameTh => _nameTh;

  @override
  String toString() {
    return '\nAccountType{id: $_id, nameTh: $_nameTh, nameEn: $_nameEn}';
  }
}
