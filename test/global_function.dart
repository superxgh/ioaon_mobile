
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ioaon_mobile/data/local/datasources/post/post_datasource.dart';
import 'package:ioaon_mobile/data/network/apis/account/account_api.dart';
import 'package:ioaon_mobile/data/network/apis/posts/post_api.dart';
import 'package:ioaon_mobile/data/network/apis/reference/reference_api.dart';
import 'package:ioaon_mobile/data/network/apis/users/user_api.dart';
import 'package:ioaon_mobile/data/network/dio_client.dart';
import 'package:ioaon_mobile/data/network/rest_client.dart';
import 'package:ioaon_mobile/data/repository.dart';
import 'package:ioaon_mobile/data/sharedpref/shared_preference_helper.dart';
import 'package:ioaon_mobile/di/module/local_module.dart';
import 'package:ioaon_mobile/di/module/network_module.dart';
import 'package:sembast/sembast.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> regisGetIt() async {
  final getIt = GetIt.instance;

  // async singletons:----------------------------------------------------------
  getIt.registerSingletonAsync<Database>(() => LocalModule.provideDatabase());
  getIt.registerSingletonAsync<SharedPreferences>(() => LocalModule.provideSharedPreferences());

  // singletons:----------------------------------------------------------------
  getIt.registerSingleton(SharedPreferenceHelper(await getIt.getAsync<SharedPreferences>()));
  getIt.registerSingleton<Dio>(NetworkModule.provideDio(getIt<SharedPreferenceHelper>()));
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(RestClient());

  // api's:---------------------------------------------------------------------
  getIt.registerSingleton(PostApi(getIt<DioClient>(), getIt<RestClient>()));
  getIt.registerSingleton(UserApi(getIt<DioClient>(), getIt<RestClient>()));
  getIt.registerSingleton(ReferenceApi(getIt<DioClient>(), getIt<RestClient>()));
  getIt.registerSingleton(AccountApi(getIt<DioClient>(), getIt<RestClient>()));

  // data sources
  getIt.registerSingleton(PostDataSource(await getIt.getAsync<Database>()));

  // repository:----------------------------------------------------------------
  getIt.registerSingleton(Repository(
    getIt<PostApi>(),
    getIt<SharedPreferenceHelper>(),
    getIt<PostDataSource>(),
    getIt<UserApi>(),
    getIt<ReferenceApi>(),
    getIt<AccountApi>(),
  ));

  return getIt;
}