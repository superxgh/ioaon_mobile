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

  // constructor:---------------------------------------------------------------
  _UserStore(Repository repository) : this._repository = repository {
    log.i('constructor()');
    // setting up disposers
    _setupDisposers();

    // checking if user is logged in
    repository.isLoggedIn.then((value) {
      this.isLoggedIn = value;
    });
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupDisposers() {
    log.i('_setupDisposers');
    _disposers = [
      reaction((_) => success, (_) => success = false, delay: 200),
    ];
  }

  // empty responses:-----------------------------------------------------------
  static ObservableFuture<bool> emptyResponse = ObservableFuture.value(false);

  // store variables:-----------------------------------------------------------
  @observable
  bool success = false;

  @observable
  ObservableFuture<bool> fetchFuture = emptyResponse;

  @computed
  bool get isLoading => fetchFuture.status == FutureStatus.pending;
  // actions:-------------------------------------------------------------------
  @action
  Future<void> signup(User user) async {
    log.i('signup()');
    final future = _repository.signup(user);
    fetchFuture = ObservableFuture(future);
    await future.then((value) async {
      log.d('signup value = $value');
      this.success = true;
      log.d('signup() success = $success');
    }).catchError((e) {
      log.e(e.toString());
      errorStore.errorMessage = DioErrorUtil.handleError(e);
      log.e('errorStore.errorMessage = ${errorStore.errorMessage}');
      throw e;
    });
  }

  @action
  Future<void> signin(dynamic data) async {
    log.i('signin()');
    log.d('signin() data = $data');
    final future = _repository.signin(data);
    fetchFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value) {
        _repository.saveIsLoggedIn(true);
        this.isLoggedIn = true;
        this.success = true;
      } else {
        print('failed to signin');
      }
    }).catchError((e) {
      print(e);
      this.isLoggedIn = false;
      this.success = false;
      throw e;
    });
  }



  void logout() {
    log.i('logout()');
    this.isLoggedIn = false;
    _repository.saveIsLoggedIn(false);
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    log.i('dispose()');
    for (final d in _disposers) {
      d();
    }
  }
}