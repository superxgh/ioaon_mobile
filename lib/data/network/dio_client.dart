import 'dart:developer';

import 'package:dio/dio.dart';

import '../../utils/tools/logging.dart';

class DioClient {
  // dio instance
  final Dio _dio;
  final log = logger(DioClient);

  // injecting dio instance
  DioClient(this._dio);

  // Get:-----------------------------------------------------------------------
  Future<dynamic> get(
      String uri, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      log.i('>>>>> get()');
      log.i('uri = $uri');
      log.i('queryParameters = $queryParameters');
      log.i('options = $options');
      log.i('cancelToken = $cancelToken');
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      log.i('response = $response');
      var res = responseFilter(response);
      log.i('res = $res');
      return res;
    } catch (e) {
      throw e;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> post(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return responseFilter(response);
    } catch (e) {
      throw e;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<dynamic> put(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final Response response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      var res = responseFilter(response);
      return res;
    } catch (e) {
      throw e;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<dynamic> delete(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final Response response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return responseFilter(response);
    } catch (e) {
      throw e;
    }
  }

  // Sender

  dynamic responseFilter(Response response) {
    try {
      if (response.statusCode == 200 || response.statusCode == 201)
        return response.data;
      else
        log.e('>>>>> responseFilter not 200 or 201');
        log.e('response.statusCode = ${response.statusCode}');
        log.e('response.data = ${response.data}');
        log.e('response.statusMessage = ${response.statusMessage}');
        throw Exception('has_error_${response.statusCode}_${response.statusMessage ?? ''}');
    } catch (e) {
      throw e;
    }
  }


}
