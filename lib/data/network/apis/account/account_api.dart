import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ioaon_mobile/data/network/constants/endpoints.dart';
import 'package:ioaon_mobile/data/network/dio_client.dart';
import 'package:ioaon_mobile/data/network/rest_client.dart';

import '../../../../constants/ioaon_global.dart';
import '../../../../models/account/account.dart';
import '../../../../models/user/user.dart';
import '../../../../utils/tools/logging.dart';

class AccountApi {

  final log = logger(AccountApi);

  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  AccountApi(this._dioClient, this._restClient);

  Future<bool> createAccountItem(AccountGroup accountGroup, AccountItem accountItem) async {
    log.w('createAccountItem()');
    try {
      final res = await _dioClient.post(Endpoints.createAccountItem, data: {
        "type": accountGroup.name,
        "data": accountItem
      });
      return res;
    } catch (e) {
      log.w('createAccountItem() error = ${e.toString()}');
      throw e;
    }
  }


}
