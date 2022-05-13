import 'dart:async';

import 'package:ioaon_mobile/data/local/datasources/post/post_datasource.dart';
import 'package:ioaon_mobile/data/sharedpref/shared_preference_helper.dart';
import 'package:ioaon_mobile/models/post/post.dart';
import 'package:ioaon_mobile/models/post/post_list.dart';
import 'package:sembast/sembast.dart';
import '../constants/ioaon_global.dart';
import '../models/account/account.dart';
import '../models/reference/account_code.dart';
import '../models/reference/account_type.dart';
import '../utils/tools/logging.dart';
import '../models/user/user.dart';
import 'local/constants/db_constants.dart';
import 'network/apis/account/account_api.dart';
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
  final AccountApi _accountApi;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  Repository(
      this._postApi,
      this._sharedPrefsHelper,
      this._postDataSource,
      this._userApi,
      this._referenceApi,
      this._accountApi);

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
    log.e('>>>>> Repository getUserByToken()');
    var token = await authToken;
    log.e('authToken = $token');

    return await _userApi.getUserByToken().then((res) {
        User user = User.fromBackEndUser(res['data']);
        log.e('user = $user');
        return user;  //res['data'];
    }).catchError((error) {
      log.e('error = ${error.toString()}');
      throw error;
    });
  }

  Future<User> emailSignin(dynamic data) async {
    log.e('>>>>> emailSignin()');
    return await _userApi.emailSignIn(data).then((res) {
        User user = User.fromBackEndUser(res['data']);
        log.e('user = $user');
        return user;  //res['data'];
    }).catchError((error) {
      log.e('error = ${error.toString()}');
      throw error;
    });
  }

  Future<dynamic> signup(dynamic data) async {
    return await _userApi.createUser(data).then((data) {
      return data;
    }).catchError((error) => throw error);
  }


  // Account:---------------------------------------------------------------------
  Future<dynamic> createAccountItem(AccountGroup accountGroup, AccountItem accountItem) async {
    log.e('>>>> createAccountItem()');
    log.e('accountGroup = $accountGroup');
    log.e('accountItem = $accountItem');
    return await _accountApi.createAccountItem(accountGroup, accountItem)
        .then((res) {
            AccountItem accountItem = AccountItem.fromMap(res['data']);
            log.e('accountItem = $accountItem');
            return accountItem;  //res['data'];
        }).catchError((error) => throw error);
  }

  Future<List<AccountItem>> getAccountItemList(dynamic data) async {
    log.e('>>>> getAccountItemList()');
    log.e('getAccountItemList() data = $data');
    return await _accountApi.getAccountItemList(data).then((res) {
        log.e('getAccountItemList() res[data] = ${res['data']}');
        List<AccountItem> accountItemList = List.from(res['data']).map((e) => AccountItem.fromMap(e)).toList();
        log.e('getAccountItemList() accountItemList = $accountItemList');
        return accountItemList;  //res['data'];
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

  // Private xxx -----------------------------------------------------------------

  // Reference: -----------------------------------------------------------------
  Future<List<AccountType>> getAccountTypeList() async {
    log.e('>>>> getAccountTypeList()');
    return await _referenceApi.getAccountTypeList().then((res) {
      List<AccountType> accountTypeList = List.from(res['data']).map((e) => AccountType.fromMap(e)).toList();
        log.e('accountTypeList = $accountTypeList');
        return accountTypeList;  //res['data'];
    }).catchError((error) => throw error);
  }

  Future<List<AccountCode>> getAccountCodeList() async {
    log.e('>>>> getAccountCodeList()');
    return await _referenceApi.getAccountCodeList().then((res) {
      List<AccountCode> accountCodeList = List.from(res).map((e) => AccountCode.fromMap(e)).toList();
        log.e('accountCodeList = $accountCodeList');
        return accountCodeList;  //res['data'];
    }).catchError((error) => throw error);
  }


}