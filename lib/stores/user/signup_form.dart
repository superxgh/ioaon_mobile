import 'package:mobx/mobx.dart';
import '../../utils/tools/validator.dart';
import '../error/error_store.dart';

part 'signup_form.g.dart';

class SignUpForm = _SignUpForm with _$SignUpForm;

abstract class _SignUpForm with Store {
  // store for handling form errors
  final FormErrorStore formErrorStore = FormErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  _SignUpForm() {
    _setupValidations();
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => fullName, validateFullName),
      reaction((_) => mobileNumber, validateMobileName),
      reaction((_) => email, validateEmail),
      reaction((_) => password, validatePassword),
      reaction((_) => confirmPassword, validateConfirmPassword),
    ];
  }

  // store variables:-----------------------------------------------------------
  @observable
  String fullName = '';

  @observable
  String mobileNumber = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @computed
  bool get canSave =>
      !formErrorStore.hasErrorsInForm &&
          fullName.isNotEmpty &&
          mobileNumber.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          confirmPassword.isNotEmpty;

  @computed
  Map<String,dynamic> get userData => {
    "fullName": fullName,
    "mobileNumber": mobileNumber,
    "email": email,
    "password": password,
    "confirmPassword": confirmPassword,
  };
  // actions:-------------------------------------------------------------------
  @action
  void setFullName(String value) => fullName = value;

  @action
  void setMobileNumber(String value) => mobileNumber = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setConfirmPassword(String value) => confirmPassword = value;

  @action
  void validateFullName(String value) => formErrorStore.fullName = validateIsEmpty(value);

  @action
  void validateMobileName(String value) => formErrorStore.mobileNumber = validateForMobileNumber(value);

  @action
  void validateEmail(String value) => formErrorStore.email = validateForEmail(value);

  @action
  void validatePassword(String value) => formErrorStore.password = validateForPassword(value);

  @action
  void validateConfirmPassword(String value) => formErrorStore.confirmPassword =  validateForConfirmPassword(password, value);

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validateFullName(fullName);
    validateMobileName(mobileNumber);
    validateEmail(email);
    validatePassword(password);
    validateConfirmPassword(confirmPassword);
  }
}

class FormErrorStore = _FormErrorStore with _$FormErrorStore;

abstract class _FormErrorStore with Store {

  @observable
  String? fullName;

  @observable
  String? mobileNumber;

  @observable
  String? email;

  @observable
  String? password;

  @observable
  String? confirmPassword;

  @computed
  bool get hasErrorsInForm => fullName != null ||
                              mobileNumber != null ||
                              email != null ||
                              password != null ||
                              confirmPassword != null;

}
