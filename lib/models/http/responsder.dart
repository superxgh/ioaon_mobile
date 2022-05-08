

class Responder {
  late int code;
  late ResponderData res;

  Responder({
    required this.code,
    required this.res
  });

  factory Responder.fromBackEnd(Map<String, dynamic> json) => Responder(
      code: json["code"] ?? 0,
      res: json["res"] ?? {}
  );

}


class ResponderData {
  dynamic data;
  late String error;
  late String message;

  ResponderData({
    required this.data,
    required this.error,
    required this.message
  });

  factory ResponderData.fromBackEnd(Map<String, dynamic> json) => ResponderData(
      data: json["data"] ?? {},
      error: json["error"] ?? '',
      message: json["message"] ?? ''
  );

}
