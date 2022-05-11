import 'package:ioaon_mobile/constants/ioaon_global.dart';
import 'package:ioaon_mobile/models/account/account.dart';
import 'package:ioaon_mobile/stores/account/input_account_form.dart';
import 'package:ioaon_mobile/stores/error/error_store.dart';
import 'package:mobx/mobx.dart';
import '../../data/repository.dart';
import '../../utils/dio/dio_error_util.dart';
import '../../utils/tools/logging.dart';

part 'account_store.g.dart';

class AccountStore = _AccountStore with _$AccountStore;

abstract class _AccountStore with Store {

  final log = logger(AccountStore);

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
  static ObservableFuture<dynamic> emptySigninResponse = ObservableFuture.value(null);

  // store variables:-----------------------------------------------------------
  @observable
  bool success = false;

  @observable
  ObservableFuture<dynamic> fetchFuture = emptySigninResponse;

  @computed
  bool get isLoading => fetchFuture.status == FutureStatus.pending;

  @observable
  String userEmail = '';

  @observable
  int currentPage = 1;

  @observable
  bool nextPage = true;

  // business logic:-------------------------------------------------------------------
  @action
  Future<void> createAccountItem(AccountGroup accountGroup, AccountItem accountItem) async {
    log.w('>>>>> createAccountItem()');
    log.w('accountGroup = $accountGroup');
    log.w('accountItem = $accountItem');

    final future = _repository.createAccountItem(accountGroup, accountItem);
    fetchFuture = ObservableFuture(future);
    await future.then((value) async {
      log.w('createAccountItem() value = $value');
      this.success = true;
    }).catchError((e) {
      log.e('createAccountItem() error = ${e.toString()}');
      errorStore.errorMessage = DioErrorUtil.handleError(e);
      log.e('errorStore.errorMessage = ${errorStore.errorMessage}');
      throw e;
    });
  }

  @action
  Future<void> getAccountItemList({bool? first}) async {
    log.w('>>>>> getAccountItemList()');
    this.currentPage = (first ?? false) ? 1 : this.currentPage;
    var data = {
      "currentPage": this.currentPage,
      "recordPerPage": recordPerPage,
    };
    final future = _repository.getAccountItemList(data);
    fetchFuture = ObservableFuture(future);
    await future.then((value) async {
      log.w('getAccountItemList() value = $value');
      this.success = true;
    }).catchError((e) {
      log.e('getAccountItemList() error = ${e.toString()}');
      errorStore.errorMessage = DioErrorUtil.handleError(e);
      log.e('errorStore.errorMessage = ${errorStore.errorMessage}');
      throw e;
    });
  }

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