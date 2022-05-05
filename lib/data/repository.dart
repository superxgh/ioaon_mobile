import 'dart:async';

import 'package:ioaon_mobile/data/local/datasources/post/post_datasource.dart';
import 'package:ioaon_mobile/data/sharedpref/shared_preference_helper.dart';
import 'package:ioaon_mobile/models/post/post.dart';
import 'package:ioaon_mobile/models/post/post_list.dart';
import 'package:sembast/sembast.dart';

import '../models/user/user.dart';
import 'local/constants/db_constants.dart';
import 'network/apis/posts/post_api.dart';
import 'network/apis/users/user_api.dart';

class Repository {
  // data source object
  final PostDataSource _postDataSource;

  // api objects
  final PostApi _postApi;
  final UserApi _userApi;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  Repository(
      this._postApi,
      this._sharedPrefsHelper,
      this._postDataSource,
      this._userApi);

  // Post: ---------------------------------------------------------------------
  Future<PostList> getPosts() async {
    // check to see if posts are present in database, then fetch from database
    // else make a network call to get all posts, store them into database for
    // later use
    return await _postApi.getPosts().then((postsList) {
      postsList.posts?.forEach((post) {
        _postDataSource.insert(post);
      });

      return postsList;
    }).catchError((error) => throw error);
  }

  Future<List<Post>> findPostById(int id) {
    //creating filter
    List<Filter> filters = [];

    //check to see if dataLogsType is not null
    Filter dataLogTypeFilter = Filter.equals(DBConstants.FIELD_ID, id);
    filters.add(dataLogTypeFilter);

    //making db call
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
  Future<bool> signin(String email, String password) async {
    return await Future.delayed(Duration(seconds: 2), ()=> true);
  }

  Future<bool> signup(User user) async {
    return await _userApi.createUser(user).then((res) {
      return true;
    }).catchError((error) => throw error);
  }

  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;

  // Theme: --------------------------------------------------------------------
  Future<void> changeBrightnessToDark(bool value) =>
      _sharedPrefsHelper.changeBrightnessToDark(value);

  bool get isDarkMode => _sharedPrefsHelper.isDarkMode;

  // Language: -----------------------------------------------------------------
  Future<void> changeLanguage(String value) =>
      _sharedPrefsHelper.changeLanguage(value);

  String? get currentLanguage => _sharedPrefsHelper.currentLanguage;
}