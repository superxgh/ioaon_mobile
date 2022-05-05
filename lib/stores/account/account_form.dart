import 'package:mobx/mobx.dart';
import '../error/error_store.dart';

part 'account_form.g.dart';

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
      reaction((_) => accountType, validateAccountType),
      reaction((_) => accountAmount, validateAccountAmount)
    ];
  }

  // store variables:-----------------------------------------------------------
  @observable
  String accountType = '';

  @observable
  double accountAmount = 0.0;

  @computed
  bool get canSave =>
      !formErrorStore.hasErrorsInForm && accountType.isNotEmpty && 0.0 == accountAmount;

  // actions:-------------------------------------------------------------------
  @action
  void setAccountType(String value) {
    accountType = value;
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
    validateAccountAmount(accountAmount);
  }
}

class FormErrorStore = _FormErrorStore with _$FormErrorStore;

abstract class _FormErrorStore with Store {

  @observable
  String? accountType;

  @observable
  String? accountAmount;

  @computed
  bool get hasErrorsInForm => accountType != null || accountAmount != null;

}
