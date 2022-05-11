class AccountItem {
  int _type;
  int _code;
  double _amount;

//<editor-fold desc="Data Methods">

  AccountItem({
    required int type,
    required int code,
    required double amount,
  })  : _type = type,
        _code = code,
        _amount = amount;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountItem &&
          runtimeType == other.runtimeType &&
          _type == other._type &&
          _code == other._code &&
          _amount == other._amount);

  @override
  int get hashCode => _type.hashCode ^ _code.hashCode ^ _amount.hashCode;

  @override
  String toString() {
    return 'AccountItem{' + ' type: $_type,' + ' code: $_code,' + ' amount: $_amount,' + '}';
  }

  AccountItem copyWith({
    int? type,
    int? code,
    double? amount,
  }) {
    return AccountItem(
      type: type ?? this._type,
      code: code ?? this._code,
      amount: amount ?? this._amount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': this._type,
      'code': this._code,
      'amount': this._amount,
    };
  }

  factory AccountItem.fromMap(Map<String, dynamic> map) {
    return AccountItem(
      type: map['type'] as int,
      code: map['code'] as int,
      amount: map['amount'] as double,
    );
  }

  int get type => _type;

  set type(int value) {
    _type = value;
  }

  double get amount => _amount;

  set amount(double value) {
    _amount = value;
  }

  int get code => _code;

  set code(int value) {
    _code = value;
  }

//</editor-fold>
}
