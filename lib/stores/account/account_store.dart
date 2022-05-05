import 'package:ioaon_mobile/stores/account/account_form.dart';
import 'package:ioaon_mobile/stores/error/error_store.dart';
import 'package:mobx/mobx.dart';
import '../../data/repository.dart';

part 'account_store.g.dart';

class AccountStore = _AccountStore with _$AccountStore;

abstract class _AccountStore with Store {
  // repository instance
  final Repository _repository;

  // store for handling form errors
  final FormErrorStore formErrorStore = FormErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _AccountStore(Repository repository) : this._repository = repository {

    // setting up disposers
    _setupDisposers();

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
  ObservableFuture<bool> signinFuture = emptySigninResponse;

  @computed
  bool get isLoading => signinFuture.status == FutureStatus.pending;

  @observable
  String userEmail = '';

  // actions:-------------------------------------------------------------------
  @action
  void setUserId(String value) {
    userEmail = value;
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

}