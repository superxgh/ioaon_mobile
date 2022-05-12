import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ioaon_mobile/data/network/constants/endpoints.dart';
import 'package:ioaon_mobile/data/network/dio_client.dart';
import 'package:ioaon_mobile/data/network/rest_client.dart';

import '../../../../models/user/user.dart';
import '../../../../utils/tools/logging.dart';

class UserApi {

  final log = logger(UserApi);

  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  UserApi(this._dioClient, this._restClient);

  Future<dynamic> createUser(dynamic data) async {
    try {
      final res = await _dioClient.post(Endpoints.createUser, data: data);
      return res;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<dynamic> emailSignIn(data) async {
    log.i('>>>>> emailSignIn()');
    log.i('data = $data');
    try {
      final res = await _dioClient.post(Endpoints.emailSignInUser, data: data);
      log.i('res = $res');
      return res;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<dynamic> getUserByToken() async {
    log.i('getUserByToken()');
    try {
      final res = await _dioClient.get(Endpoints.getUserByAuthToken);
      log.i('res = $res');
      return res;
    } catch (e) {
      log.i('e = ${e.toString()}');
      throw e;
    }
  }


}
