class AccountCode {
  int? _code;
  String? _nameTh;
  String? _nameEn;

  AccountCode({
    required int? code,
    required String? nameTh,
    required String? nameEn,
  })  : _code = code,
        _nameTh = nameTh,
        _nameEn = nameEn;

  factory AccountCode.fromMap(Map<String, dynamic> json) => AccountCode(
    code: json["code"],
    nameTh: json["nameTh"],
    nameEn: json["nameEn"],
  );

  Map<String, dynamic> toMap() => {
    "code": _code,
    "nameTh": _nameTh,
    "nameEn": _nameEn,
  };

  int? get code => _code;

  String? get nameEn => _nameEn;

  String? get nameTh => _nameTh;

  @override
  String toString() {
    return '\nAccountCode{code: $_code, nameTh: $_nameTh, nameEn: $_nameEn}';
  }
}
