import 'dart:async';

import 'package:ioaon_mobile/data/local/datasources/post/post_datasource.dart';
import 'package:ioaon_mobile/data/sharedpref/shared_preference_helper.dart';
import 'package:ioaon_mobile/models/post/post.dart';
import 'package:ioaon_mobile/models/post/post_list.dart';
import 'package:sembast/sembast.dart';

import '../models/reference/account_type_list.dart';
import '../utils/tools/logging.dart';
import '../models/user/user.dart';
import 'local/constants/db_constants.dart';
import 'network/apis/posts/post_api.dart';
import 'network/apis/reference/reference_api.dart';
import 'network/apis/users/user_api.dart';

class Repository {

  final log = logger(Repository);

  // data source object
  final PostDataSource _postDataSource;

  // api objects
  final PostApi _postApi;
  final UserApi _userApi;
  final ReferenceApi _referenceApi;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  Repository(
      this._postApi,
      this._sharedPrefsHelper,
      this._postDataSource,
      this._userApi,
      this._referenceApi);

  // Post: ---------------------------------------------------------------------
  Future<PostList> getPosts() async {
    return await _postApi.getPosts().then((postsList) {
      postsList.posts?.forEach((post) {
        _postDataSource.insert(post);
      });

      return postsList;
    }).catchError((error) => throw error);
  }

  Future<List<Post>> findPostById(int id) {
    List<Filter> filters = [];
    Filter dataLogTypeFilter = Filter.equals(DBConstants.FIELD_ID, id);
    filters.add(dataLogTypeFilter);
    return _postDataSource
        .getAllSortedByFilter(filters: filters)
        .then((posts) => posts)
        .catchError((error) => throw error);
  }

  Future<int> insert(Post post) => _postDataSource
      .insert(post)
      .then((id) => id)
      .catchError((error) => throw error);

  Future<int> update(Post post) => _postDataSource
      .update(post)
      .then((id) => id)
      .catchError((error) => throw error);

  Future<int> delete(Post post) => _postDataSource
      .update(post)
      .then((id) => id)
      .catchError((error) => throw error);


  // User:---------------------------------------------------------------------
  Future<User> getUserByToken() async {
    log.e('>>>> Repository getUserByToken()');

    return await _userApi.getUserByToken().then((res) {
      log.e('res = $res');
      log.e('res.statusCode = ${res.statusCode}');
      if (res.statusCode == 200) {
        log.e('res[data] = ${res.data['data']}');
        User user = User.fromBackEndUser(res.data['data']);
        log.e('user = $user');
        return user;  //res['data'];
      } else {
        throw Exception('Have no data.');
      }
    }).catchError((error) {
      log.e('error = ${error.toString()}');
      throw error;
    });
  }

  Future<User> emailSignin(dynamic data) async {
    log.e('>>>> Repository emailSignin()');
    log.e('data = $data');

    return await _userApi.emailSignIn(data).then((res) {
      log.e('res = $res');
      log.e('res.statusCode = ${res.statusCode}');
      if (res.statusCode == 200) {
        log.e('res[data] = ${res.data['data']}');
        User user = User.fromBackEndUser(res.data['data']);
        log.e('user = $user');
        return user;  //res['data'];
      } else {
        throw Exception('Have no data.');
      }
    }).catchError((error) {
      log.e('error = ${error.toString()}');
      throw error;
    });
  }

  Future<bool> signup(User user) async {
    return await _userApi.createUser(user).then((res) {
      return true;
    }).catchError((error) => throw error);
  }

  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;

  Future<void> saveAuthToken(String value) =>
      _sharedPrefsHelper.saveAuthToken(value);

  Future<String?> get authToken => _sharedPrefsHelper.authToken;

  // Theme: --------------------------------------------------------------------
  Future<void> changeBrightnessToDark(bool value) =>
      _sharedPrefsHelper.changeBrightnessToDark(value);

  bool get isDarkMode => _sharedPrefsHelper.isDarkMode;

  // Language: -----------------------------------------------------------------
  Future<void> changeLanguage(String value) =>
      _sharedPrefsHelper.changeLanguage(value);

  String? get currentLanguage => _sharedPrefsHelper.currentLanguage;

  // Private: -----------------------------------------------------------------

  // Reference: -----------------------------------------------------------------
  Future<AccountTypeList> getAccountTypes() async {
    log.e('>>>> getAccountTypes()');
    return await _referenceApi.getAccountTypes().then((res) {
      // accountTypesList.accountTypes?.forEach((accountType) {
      //   _accountTypeDataSource.insert(accountType);
      // });
      log.e('getAccountTypes() res = $res');
      if (res.statusCode == 200) {
        log.e('getAccountTypes() res[data] = ${res.data['data']}');
        AccountTypeList accountTypeList = AccountTypeList.fromJson(res.data['data']);
        log.e('getAccountTypes() accountTypeList = $accountTypeList');
        return accountTypeList;  //res['data'];
      } else {
        throw Exception('Have no data.');
      }
    }).catchError((error) => throw error);
  }

}