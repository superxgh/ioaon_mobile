

class Responder {
  int _code;
  ResponderData _res;

//<editor-fold desc="Data Methods">

  Responder({
    required int code,
    required ResponderData res,
  })  : _code = code,
        _res = res;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Responder && runtimeType == other.runtimeType && _code == other._code && _res == other._res);

  @override
  int get hashCode => _code.hashCode ^ _res.hashCode;

  @override
  String toString() {
    return 'Responder{' + ' _code: $_code,' + ' _res: $_res,' + '}';
  }

  Responder copyWith({
    int? code,
    ResponderData? res,
  }) {
    return Responder(
      code: code ?? this._code,
      res: res ?? this._res,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_code': this._code,
      '_res': this._res,
    };
  }

  factory Responder.fromMap(Map<String, dynamic> map) {
    return Responder(
      code: map['_code'] as int,
      res: map['_res'] as ResponderData,
    );
  }

  int get code => _code;

  set code(int value) {
    _code = value;
  }

  ResponderData get res => _res;

  set res(ResponderData value) {
    _res = value;
  }

//</editor-fold>
}


class ResponderData {
  dynamic _data;
  String _error;
  String _message;

//<editor-fold desc="Data Methods">

  ResponderData({
    required dynamic data,
    required String error,
    required String message,
  })  : _data = data,
        _error = error,
        _message = message;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ResponderData &&
          runtimeType == other.runtimeType &&
          _data == other._data &&
          _error == other._error &&
          _message == other._message);

  @override
  int get hashCode => _data.hashCode ^ _error.hashCode ^ _message.hashCode;

  @override
  String toString() {
    return 'ResponderData{' + ' _data: $_data,' + ' _error: $_error,' + ' _message: $_message,' + '}';
  }

  ResponderData copyWith({
    dynamic? data,
    String? error,
    String? message,
  }) {
    return ResponderData(
      data: data ?? this._data,
      error: error ?? this._error,
      message: message ?? this._message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_data': this._data,
      '_error': this._error,
      '_message': this._message,
    };
  }

  factory ResponderData.fromMap(Map<String, dynamic> map) {
    return ResponderData(
      data: map['_data'] as dynamic,
      error: map['_error'] as String,
      message: map['_message'] as String,
    );
  }

  dynamic get data => _data;

  set data(dynamic value) {
    _data = value;
  }

  String get message => _message;

  set message(String value) {
    _message = value;
  }

  String get error => _error;

  set error(String value) {
    _error = value;
  }

//</editor-fold>
}
