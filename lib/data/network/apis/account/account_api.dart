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

  Future<dynamic> createAccountItem(AccountGroup accountGroup, AccountItem accountItem) async {
    log.w('createAccountItem()');
    try {
      var data = {
        "group": accountGroup.name.toUpperCase(),
        "smallAccountType": accountItem.type,
        "smallAccountCode": accountItem.code,
        "amount": accountItem.amount
      };
      log.w('data = $data');
      final res = await _dioClient.post(Endpoints.createAccountItem, data: data);
      log.w('res = $res');
      return res;
    } catch (e) {
      log.w('createAccountItem() error = ${e.toString()}');
      throw e;
    }
  }

 Future<dynamic> getAccountItemList(dynamic data) async {
    log.w('getAccountItemList()');
    try {
      log.w('data = $data');
      final res = await _dioClient.get('${Endpoints.getAccountItemList}/${data.currentPage}/${data.recordPerPage}');
      log.w('res = $res');
      return res;
    } catch (e) {
      log.w('getAccountItemList() error = ${e.toString()}');
      throw e;
    }
  }


}
