import 'package:ioaon_mobile/stores/error/error_store.dart';
import 'package:mobx/mobx.dart';
import '../../data/repository.dart';
import '../../models/reference/account_code_list.dart';
import '../../models/reference/account_type_list.dart';
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

    _loadReferenceData();

  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupDisposers() {
    _disposers = [
      reaction((_) => success, (_) => success = false, delay: 200),
    ];
  }

  Future<void> _loadReferenceData() async {
    log.i('_loadReferenceData()');

    await getAccountTypes();
    await getAccountCodes();

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
  AccountTypeList accountTypeList = AccountTypeList.empty();

  @observable
  AccountCodeList accountCodeList = AccountCodeList.empty();

  // business logic:-------------------------------------------------------------------
  @action
  Future getAccountTypes() async {
    log.i('>>>>> getAccountTypes()');
    final future = _repository.getAccountTypes();
    fetchFuture = ObservableFuture(future);
    future.then((accountTypeList) {
      this.accountTypeList = accountTypeList;
      log.w('this.accountTypeList = ${this.accountTypeList}');
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }

  @action
  Future getAccountCodes() async {
    log.i('>>>>> getAccountCodes()');
    final future = _repository.getAccountCodes();
    fetchFuture = ObservableFuture(future);
    future.then((accountCodeList) {
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