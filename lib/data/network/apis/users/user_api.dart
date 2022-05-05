import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ioaon_mobile/data/network/constants/endpoints.dart';
import 'package:ioaon_mobile/data/network/dio_client.dart';
import 'package:ioaon_mobile/data/network/rest_client.dart';

import '../../../../models/user/user.dart';

class UserApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  UserApi(this._dioClient, this._restClient);

  /// Returns list of post in response
  Future<bool> createUser(User user) async {
    try {
      final res = await _dioClient.post(Endpoints.postCreateUser, data: user.toCreateUserByEmailMap());
      log('createUser res = $res', name: 'UserApi');
      // log('createUser res = ${res.data}', name: 'UserApi');
      // log('createUser res = ${res.headers}', name: 'UserApi');
      // log('createUser res = ${res.requestOptions}', name: 'UserApi');
      // log('createUser res = ${res.statusCode}', name: 'UserApi');
      return true;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

}
