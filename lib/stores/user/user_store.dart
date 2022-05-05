import 'dart:developer';

import 'package:ioaon_mobile/stores/error/error_store.dart';
import 'package:mobx/mobx.dart';

import '../../data/repository.dart';
import '../../models/user/user.dart';
import '../../utils/dio/dio_error_util.dart';
import '../form/form_store.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  // repository instance
  final Repository _repository;

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  // bool to check if current user is logged in
  bool isLoggedIn = false;

  // constructor:---------------------------------------------------------------
  _UserStore(Repository repository) : this._repository = repository {

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
    _disposers = [
      reaction((_) => success, (_) => success = false, delay: 200),
    ];
  }

  // empty responses:-----------------------------------------------------------
  static ObservableFuture<bool> emptySigninResponse = ObservableFuture.value(false);

  // store variables:-----------------------------------------------------------
  @observable
  bool success = false;


  @observable
  ObservableFuture<bool> fetchFuture = emptySigninResponse;

  @computed
  bool get isLoading => fetchFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future<void> signup(User user) async {

    final future = _repository.signup(user);
    fetchFuture = ObservableFuture(future);
    await future.then((value) async {
      log('signup value = $value', name: 'UserStore');
    }).catchError((e) {
      log(e.toString(), name: 'UserStore');
      errorStore.errorMessage = DioErrorUtil.handleError(e);
      log('errorStore.errorMessage = ${errorStore.errorMessage}', name: 'UserStore');
      throw e;
    });
  }

  @action
  Future<void> signin(String email, String password) async {

    final future = _repository.signin(email, password);
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
    this.isLoggedIn = false;
    _repository.saveIsLoggedIn(false);
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}