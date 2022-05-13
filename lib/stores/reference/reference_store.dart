import 'package:ioaon_mobile/stores/error/error_store.dart';
import 'package:mobx/mobx.dart';
import '../../data/repository.dart';
import '../../models/reference/account_code.dart';
import '../../models/reference/account_type.dart';
import '../../utils/dio/dio_error_util.dart';
import '../../utils/tools/logging.dart';

part 'reference_store.g.dart';

class ReferenceStore = _ReferenceStore with _$ReferenceStore;

abstract class _ReferenceStore with Store {

  final log = logger(ReferenceStore);

  // repository instance
  final Repository _repository;

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _ReferenceStore(Repository repository) : this._repository = repository {

    log.i('constructor()');

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
  static ObservableFuture<dynamic> emptySigninResponse = ObservableFuture.value(null);

  // store variables:-----------------------------------------------------------
  @observable
  bool success = false;

  @observable
  ObservableFuture<dynamic> fetchFuture = emptySigninResponse;

  @computed
  bool get isLoading => fetchFuture.status == FutureStatus.pending;

  @observable
  List<AccountType> accountTypeList = [];

  @observable
  List<AccountCode> accountCodeList = [];

  // business logic:-------------------------------------------------------------------
  @action
  Future<void> getAccountTypeList() async {
    log.i('>>>>> getAccountTypeList()');
    final future = _repository.getAccountTypeList();
    fetchFuture = ObservableFuture(future);
    await future.then((accountTypeList) {
      this.accountTypeList = accountTypeList;
      log.w('this.accountTypeList = ${this.accountTypeList}');
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }

  @action
  Future<void> getAccountCodeList() async {
    log.i('>>>>> getAccountCodeList()');
    final future = _repository.getAccountCodeList();
    fetchFuture = ObservableFuture(future);
    await future.then((accountCodeList) {
      this.accountCodeList = accountCodeList;
      log.w('this.accountCodeList = ${this.accountCodeList}');
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }

  // actions:-------------------------------------------------------------------
  // @action
  // void setUserId(String value) {
  //   userEmail = value;
  // }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

}