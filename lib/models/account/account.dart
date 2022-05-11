import 'dart:convert';
import 'dart:developer';

import 'package:ioaon_mobile/utils/tools/date_time.dart';

class AccountItem {
  String? _group;
  int? _type;
  int? _code;
  double? _amount;
  String? _status;
  DateTime? _createDate;

//<editor-fold desc="Data Methods">

  AccountItem({
    required String? group,
    required int? type,
    required int? code,
    required double? amount,
    required String? status,
    required DateTime? createDate,
  })  : _group = group,
        _type = type,
        _code = code,
        _amount = amount,
        _status = status,
        _createDate = createDate;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountItem &&
          runtimeType == other.runtimeType &&
          _group == other._group &&
          _type == other._type &&
          _code == other._code &&
          _amount == other._amount &&
          _status == other._status &&
          _createDate == other._createDate);

  @override
  int get hashCode =>
      _group.hashCode ^ _type.hashCode ^ _code.hashCode ^ _amount.hashCode ^ _status.hashCode ^ _createDate.hashCode;

  @override
  String toString() {
    return '\nAccountItem{' +
        ' _group: $_group,' +
        ' _type: $_type,' +
        ' _code: $_code,' +
        ' _amount: $_amount,' +
        ' _status: $_status,' +
        ' _createDate: $_createDate,' +
        '}';
  }

  AccountItem copyWith({
    String? group,
    int? type,
    int? code,
    double? amount,
    String? status,
    DateTime? createDate,
  }) {
    return AccountItem(
      group: group ?? this._group,
      type: type ?? this._type,
      code: code ?? this._code,
      amount: amount ?? this._amount,
      status: status ?? this._status,
      createDate: createDate ?? this._createDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_group': this._group,
      '_type': this._type,
      '_code': this._code,
      '_amount': this._amount,
      '_status': this._status,
      '_createDate': this._createDate,
    };
  }

  factory AccountItem.fromMap(dynamic map) {
    // log('AccountItem map = $map');
    // log('AccountItem group = ${map['group']}');
    // log('AccountItem smallAccountType = ${map['smallAccountType']}');
    // log('AccountItem smallAccountCode = ${map['smallAccountCode']}');
    // log('AccountItem amount = ${map['amount']}');
    // log('AccountItem status = ${map['status']}');
    // log('AccountItem createdAt = ${map['createdAt']}');
    return AccountItem(
      group: map['group'],
      type: map['smallAccountType'],
      code: map['smallAccountCode'],
      amount: map['amount'].toDouble(),
      status: map['status'],
      createDate: strToDateTime(map['createdAt']),
    );
  }

  String? get group => _group;

  DateTime? get createDate => _createDate;

  String? get status => _status;

  double? get amount => _amount;

  int? get code => _code;

  int? get type => _type;

//</editor-fold>
}
