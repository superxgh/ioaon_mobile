import 'package:mobx/mobx.dart';
import '../../utils/tools/validator.dart';
import '../error/error_store.dart';

part 'forgot_password_form.g.dart';

class ForgotPasswordForm = _ForgotPasswordForm with _$ForgotPasswordForm;

abstract class _ForgotPasswordForm with Store {
  // store for handling form errors
  final FormErrorStore formErrorStore = FormErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  _ForgotPasswordForm() {
    _setupValidations();
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => email, validateEmail)
    ];
  }

  // store variables:-----------------------------------------------------------
  @observable
  String email = '';

  @computed
  bool get canSend =>
      !formErrorStore.hasErrorsInForm &&
          email.isNotEmpty;

  @computed
  Map<String,dynamic> get data => {
    "email": email,
  };
  // actions:-------------------------------------------------------------------
  @action
  void setEmail(String value) => email = value;

  @action
  void validateEmail(String value) => formErrorStore.email = validateForEmail(value);

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

}

class FormErrorStore = _FormErrorStore with _$FormErrorStore;

abstract class _FormErrorStore with Store {

  @observable
  String? email;

  @computed
  bool get hasErrorsInForm => email != null;

}
