import 'package:ioaon_mobile/data/network/constants/endpoints.dart';
import 'package:ioaon_mobile/data/sharedpref/shared_preference_helper.dart';
import 'package:dio/dio.dart';

import '../../utils/tools/logging.dart';

abstract class NetworkModule {
  /// A singleton dio provider.
  ///
  /// Calling it multiple times will return the same instance.
  static Dio provideDio(SharedPreferenceHelper sharedPrefHelper) {
    final log = logger(NetworkModule);
    log.i('>>>>> provideDio()');
    final dio = Dio();

    dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
            log.e('onRequest()');
            // getting token
            var token = await sharedPrefHelper.authToken;
            // var token = "CREATE USER";
            log.e('Auth token is $token');
            if (token != null) {
              options.headers.putIfAbsent('Authorization', () => 'Bearer ' + token);
            } else {
              log.e('Auth token is null');
            }

            return handler.next(options);
          },
        ),
      );

    return dio;
  }
}
