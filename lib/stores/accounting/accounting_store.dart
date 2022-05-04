import 'package:ioaon_mobile/stores/accounting/accounting_form.dart';
import 'package:ioaon_mobile/stores/error/error_store.dart';
import 'package:mobx/mobx.dart';
import '../../data/repository.dart';

part 'accounting_store.g.dart';

class AccountingStore = _AccountingStore with _$AccountingStore;

abstract class _AccountingStore with Store {
  // repository instance
  final Repository _repository;

  // store for handling form errors
  final FormErrorStore formErrorStore = FormErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _AccountingStore(Repository repository) : this._repository = repository {

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
  static ObservableFuture<bool> emptyLoginResponse = ObservableFuture.value(false);

  // store variables:-----------------------------------------------------------
  @observable
  bool success = false;

  @observable
  ObservableFuture<bool> loginFuture = emptyLoginResponse;

  @computed
  bool get isLoading => loginFuture.status == FutureStatus.pending;

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