import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ioaon_mobile/data/network/constants/endpoints.dart';
import 'package:ioaon_mobile/data/network/dio_client.dart';
import 'package:ioaon_mobile/data/network/rest_client.dart';

import '../../../../models/user/user.dart';
import '../../../../utils/tools/logging.dart';

class ReferenceApi {

  final log = logger(ReferenceApi);

  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  ReferenceApi(this._dioClient, this._restClient);

  Future<dynamic> getAccountTypeList() async {
    try {
      final res = await _dioClient.get(Endpoints.getAccountTypes);
      return res;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<dynamic> getAccountCodeList() async {
    try {
      final res = await _dioClient.get(Endpoints.getAccountCodes);
      return res;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }


}
