
import 'dart:developer';

import 'package:ioaon_mobile/data/local/datasources/post/post_datasource.dart';
import 'package:ioaon_mobile/data/network/apis/posts/post_api.dart';
import 'package:ioaon_mobile/data/network/dio_client.dart';
import 'package:ioaon_mobile/data/network/rest_client.dart';
import 'package:ioaon_mobile/data/repository.dart';
import 'package:ioaon_mobile/data/sharedpref/shared_preference_helper.dart';
import 'package:ioaon_mobile/di/module/local_module.dart';
import 'package:ioaon_mobile/di/module/network_module.dart';
import 'package:ioaon_mobile/stores/error/error_store.dart';
import 'package:ioaon_mobile/stores/form/form_store.dart';
import 'package:ioaon_mobile/stores/language/language_store.dart';
import 'package:ioaon_mobile/stores/post/post_store.dart';
import 'package:ioaon_mobile/stores/theme/theme_store.dart';
import 'package:ioaon_mobile/stores/user/user_store.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/network/apis/reference/reference_api.dart';
import '../../data/network/apis/users/user_api.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  log('setupLocator()', name: 'ServiceLocator');
  // factories:-----------------------------------------------------------------
  getIt.registerFactory(() => ErrorStore());
  getIt.registerFactory(() => FormStore());

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

  // data sources
  getIt.registerSingleton(PostDataSource(await getIt.getAsync<Database>()));

  // repository:----------------------------------------------------------------
  getIt.registerSingleton(Repository(
    getIt<PostApi>(),
    getIt<SharedPreferenceHelper>(),
    getIt<PostDataSource>(),
    getIt<UserApi>(),
    getIt<ReferenceApi>(),
  ));

  // stores:--------------------------------------------------------------------
  // getIt.registerSingleton(LanguageStore(getIt<Repository>()));
  // getIt.registerSingleton(PostStore(getIt<Repository>()));
  // getIt.registerSingleton(ThemeStore(getIt<Repository>()));
  // getIt.registerSingleton(UserStore(getIt<Repository>()));
}
