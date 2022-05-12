import 'dart:async';
import 'dart:convert';

import 'package:ioaon_mobile/data/network/constants/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:ioaon_mobile/data/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/tools/logging.dart';
import '../sharedpref/constants/preferences.dart';
import 'exceptions/network_exceptions.dart';

class RestClient {
  // instantiate json decoder for json serialization
  final JsonDecoder _decoder = JsonDecoder();
  final log = logger(RestClient);
  // Get:-----------------------------------------------------------------------
  Future<dynamic> get(String path) async {
    log.e('>>>>> get()');
    // return http.get(Uri.https(Endpoints.baseUrl, path)).then(_createResponse);
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString(Preferences.auth_token);
    log.e('token = $token');
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${ token ?? '' }',
    };
    log.e('headers = $headers');
    return http.get(
      Uri.parse(path),
      headers: headers
    ) .then((_createResponse) {
      log.e('_createResponse = $_createResponse');
      return _createResponse;
    })
      .catchError((e) {
      log.e('token = ${e.toString()}');
    });
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> post(String path,
      {Map<String, String>? headers, body, encoding}) {
    return http
        .post(
          Uri.https(Endpoints.baseUrl, path),
          body: body,
          headers: headers,
          encoding: encoding,
        )
        .then(_createResponse);
  }

  // Put:----------------------------------------------------------------------
  Future<dynamic> put(String path,
      {Map<String, String>? headers, body, encoding}) {
    return http
        .put(
          Uri.https(Endpoints.baseUrl, path),
          body: body,
          headers: headers,
          encoding: encoding,
        )
        .then(_createResponse);
  }

  // Delete:----------------------------------------------------------------------
  Future<dynamic> delete(String path,
      {Map<String, String>? headers, body, encoding}) {
    return http
        .delete(
          Uri.https(Endpoints.baseUrl, path),
          body: body,
          headers: headers,
          encoding: encoding,
        )
        .then(_createResponse);
  }

  // Response:------------------------------------------------------------------
  dynamic _createResponse(http.Response response) {
    final String res = response.body;
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400) {
      throw NetworkException(
          message: 'Error fetching data from server', statusCode: statusCode);
    }

    return _decoder.convert(res);
  }
}
