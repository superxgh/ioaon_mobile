import 'package:mobx/mobx.dart';
import '../error/error_store.dart';

part 'accounting_form.g.dart';

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {
  // store for handling form errors
  final FormErrorStore formErrorStore = FormErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  _FormStore() {
    _setupValidations();
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => accountingType, validateAccountingType),
      reaction((_) => accountingAmount, validateAccountingAmount)
    ];
  }

  // store variables:-----------------------------------------------------------
  @observable
  String accountingType = '';

  @observable
  double accountingAmount = 0.0;

  @computed
  bool get canSave =>
      !formErrorStore.hasErrorsInForm && accountingType.isNotEmpty && 0.0 == accountingAmount;

  // actions:-------------------------------------------------------------------
  @action
  void setAccountingType(String value) {
    accountingType = value;
  }

  @action
  void setAccountingAmount(double value) {
    accountingAmount = value;
  }

  @action
  void validateAccountingType(String value) {
    if (value.isEmpty) {
      formErrorStore.accountingType = "Accounting type can't be empty";
    } else {
      formErrorStore.accountingType = null;
    }
  }

  @action
  void validateAccountingAmount(double value) {
    if (0.0 >= value) {
      formErrorStore.accountingAmount = "Accounting amount can't be zero";
    } else {
      formErrorStore.accountingAmount = null;
    }
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validateAccountingType(accountingType);
    validateAccountingAmount(accountingAmount);
  }
}

class FormErrorStore = _FormErrorStore with _$FormErrorStore;

abstract class _FormErrorStore with Store {

  @observable
  String? accountingType;

  @observable
  String? accountingAmount;

  @computed
  bool get hasErrorsInForm => accountingType != null || accountingAmount != null;

}
