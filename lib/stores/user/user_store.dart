import 'dart:developer';

import 'package:ioaon_mobile/stores/error/error_store.dart';
import 'package:mobx/mobx.dart';

import '../../data/repository.dart';
import '../../utils/tools/logging.dart';
import '../../models/user/user.dart';
import '../../utils/dio/dio_error_util.dart';
import '../form/form_store.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  
  final log = logger(UserStore);
  // repository instance
  final Repository _repository;

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  // bool to check if current user is logged in
  bool isLoggedIn = false;
  String authToken = '';

  // constructor:---------------------------------------------------------------
  _UserStore(Repository repository) : this._repository = repository {
    log.w('>>>>> constructor()');
    _setupDisposers();


  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupDisposers() {
    log.w('>>>>> _setupDisposers()');
    _disposers = [
      reaction((_) => success, (_) => success = false, delay: 200),
    ];
  }

  // store variables:-----------------------------------------------------------
  @observable
  bool success = false;

  @observable
  ObservableFuture<dynamic> fetchFuture = ObservableFuture.value(null);

  @computed
  bool get isLoading => fetchFuture.status == FutureStatus.pending;

  @observable
  User currentUser = User.empty();

  // actions:-------------------------------------------------------------------
  @action
  Future<void> initIsLoggedInAndAuthToken() async {
    log.w('>>>>> initIsLoggedInAndAuthToken()');
    await _repository.isLoggedIn.then((value) async {
      log.w('isLoggedIn = $value');
      this.isLoggedIn = value;
      if (this.isLoggedIn) {
        await _repository.authToken.then((token) async {
          log.w('token = $token');
          if((token ?? '') != '') {
            this.authToken = token!;
            // _getUserByToken();
          } else {
            await _repository.saveIsLoggedIn(false);
          }
        })
        .catchError((e) {
          log.w('error = ${e.toString()}');
        });
      }
    });
  }

  @action
  Future<void> signup(dynamic data) async {
    log.w('>>>>> signup()');
    final future = _repository.signup(data);
    fetchFuture = ObservableFuture(future);
    await future.then((value) async {
      log.w('value = $value');
      this.success = true;
      log.w('success = $success');
    }).catchError((e) {
      log.e(e.toString());
      errorStore.errorMessage = DioErrorUtil.handleError(e);
      log.e('errorStore.errorMessage = ${errorStore.errorMessage}');
      throw e;
    });
  }

  @action
  Future<void> signin(dynamic data) async {
    log.w('>>>>> signin()');
    log.w('data = $data');
    final future = _repository.emailSignin(data);
    fetchFuture = ObservableFuture(future);
    await future.then((user) async {
      // log.w('user = $user');
      this.currentUser = user;
      await _repository.saveIsLoggedIn(true);
      await _repository.saveAuthToken(this.currentUser.authToken!);
      this.isLoggedIn = true;
      this.success = true;
      log.w('this.currentUser = ${this.currentUser}');
      log.w('saveIsLoggedIn(true) , success = true');
    }).catchError((e) async {
      this.isLoggedIn = false;
      this.success = false;
      await _repository.saveIsLoggedIn(false);
      log.e('isLoggedIn = false , success = false');
      log.e(e.toString());
      errorStore.errorMessage = DioErrorUtil.handleError(e);
      log.e('errorStore.errorMessage = ${errorStore.errorMessage}');
      throw e;
    });
  }

  void logout() {
    log.w('logout()');
    this.isLoggedIn = false;
    _repository.saveIsLoggedIn(false);
  }

  Future<void> getUserByToken() async {
    log.w('>>>>> _getUserByToken()');
    log.w('this.isLoggedIn = ${this.isLoggedIn}');
    log.w('this.authToken = ${this.authToken}');

    final future = _repository.getUserByToken();
    fetchFuture = ObservableFuture(future);
    await future.then((user) async {
      log.w('user = $user');
      this.currentUser = user;
    }).catchError((e) {
      log.e(e.toString());
      errorStore.errorMessage = DioErrorUtil.handleError(e);
      log.e('errorStore.errorMessage = ${errorStore.errorMessage}');
      throw e;
    });

  }
  // general methods:-----------------------------------------------------------
  void dispose() {
    log.w('dispose()');
    for (final d in _disposers) {
      d();
    }
  }
}