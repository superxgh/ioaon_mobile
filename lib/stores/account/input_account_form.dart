import 'package:mobx/mobx.dart';
import '../error/error_store.dart';

part 'input_account_form.g.dart';

class InputAccountForm = _InputAccountForm with _$InputAccountForm;

abstract class _InputAccountForm with Store {
  // store for handling form errors
  final FormErrorStore formErrorStore = FormErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  _InputAccountForm() {
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
  String accountType = '';

  @observable
  int accountCode = 0;

  @observable
  double accountAmount = 0.0;

  @computed
  bool get canSave =>
      !formErrorStore.hasErrorsInForm && accountType.isNotEmpty && 0 < accountCode && 0.0 < accountAmount;

  @computed
  Map<String, dynamic> get data => {
    "accType": accountType,
    "accCode": accountCode,
    "amount": accountAmount
  };

  // actions:-------------------------------------------------------------------
  @action
  void setAccountType(String value) {
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
  void validateAccountType(String value) {
    if (value.isEmpty) {
      formErrorStore.accountType = "Account type can't be empty";
    } else {
      formErrorStore.accountType = null;
    }
  }

  @action
  void validateAccountCode(int value) {
    if (0 < value) {
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
