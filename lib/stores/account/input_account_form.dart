import 'package:ioaon_mobile/constants/ioaon_global.dart';
import 'package:mobx/mobx.dart';
import '../../models/account/account.dart';
import '../../utils/tools/date_time.dart';
import '../error/error_store.dart';

part 'input_account_form.g.dart';

class InputIEAccountForm = _InputIEAccountForm with _$InputIEAccountForm;

abstract class _InputIEAccountForm with Store {
  // store for handling form errors
  final FormErrorStore formErrorStore = FormErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  _InputIEAccountForm() {
    _setupValidations();
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => accountType, validateAccountType),
      reaction((_) => accountAmount, validateAccountAmount)
    ];
  }

  // store variables:-----------------------------------------------------------
  @observable
  int accountType = 0;

  @observable
  int accountCode = 0;

  @observable
  double accountAmount = 0.0;

  @observable
  AccountGroup group = AccountGroup.Personal;

  @computed
  bool get canSave =>
      !formErrorStore.hasErrorsInForm && 0 < accountType && 0 < accountCode && 0.0 < accountAmount;

  @computed
  AccountItem get toAccountItem => AccountItem(
      type: accountType,
      code: accountCode,
      amount: accountAmount,
      group: group.name,
      createDate: getCurrentDateTimeNow(),
      status: AccountStatus.Created.name
  );

  // actions:-------------------------------------------------------------------
  @action
  void setAccountType(int value) {
    accountType = value;
  }

  @action
  void setAccountCode(int value) {
    accountCode = value;
  }

  @action
  void setAccountAmount(double value) {
    accountAmount = value;
  }

  @action
  void validateAccountType(int value) {
    if (0 == value) {
      formErrorStore.accountType = "Account type can't be zero";
    } else {
      formErrorStore.accountType = null;
    }
  }

  @action
  void validateAccountCode(int value) {
    if (0 == value) {
      formErrorStore.accountCode = "Account code can't be zero";
    } else {
      formErrorStore.accountCode = null;
    }
  }

  @action
  void validateAccountAmount(double value) {
    if (0.0 >= value) {
      formErrorStore.accountAmount = "Account amount can't be zero";
    } else {
      formErrorStore.accountAmount = null;
    }
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validateAccountType(accountType);
    validateAccountCode(accountCode);
    validateAccountAmount(accountAmount);
  }
}

class FormErrorStore = _FormErrorStore with _$FormErrorStore;

abstract class _FormErrorStore with Store {

  @observable
  String? accountType;

  @observable
  String? accountCode;

  @observable
  String? accountAmount;

  @computed
  bool get hasErrorsInForm => accountType != null ||  accountCode != null || accountAmount != null;

}
