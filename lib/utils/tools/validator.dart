

String? validateForMobileNumber(String value) {
  String? str;
  RegExp regExp = new RegExp(
    r"((\+66|0)(\d{1,2}\-?\d{3}\-?\d{3,4}))",
    caseSensitive: false,
    multiLine: false,
  );
  if (value.isEmpty) {
    str = "mobile_number_can_t_be_empty";
  } else if (!regExp.hasMatch(value)) {
    str = "invalid_mobile_number";
  } else {
    str = null;
  }
  return str;
}

String? validateForEmail(String value) {
  String? str;
  RegExp regExp = new RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    caseSensitive: false,
    multiLine: false,
  );
  if (value.isEmpty) {
    str = "e_mail_can_t_be_zero";
  } else if (!regExp.hasMatch(value)) {
    str = "invalid_email";
  } else {
    str = null;
  }
  return str;
}

String? validateForPassword(String value) {
  String? str;
  RegExp regExp = new RegExp(
    r"\s+",
    caseSensitive: false,
    multiLine: false,
  );
  if (value.isEmpty) {
    str = "password_can_t_be_empty";
  } else if (regExp.hasMatch(value)) {
    str = "invalid_password";
  } else {
    str = null;
  }
  return str;
}

String? validateForConfirmPassword(String password, String value) {
  String? str;
  RegExp regExp = new RegExp(
    r"\s+",
    caseSensitive: false,
    multiLine: false,
  );
  if (value.isEmpty) {
    str = "password_can_t_be_empty";
  } else if (regExp.hasMatch(value)) {
    str = "invalid_password";
  } else if (password != value) {
    str = "not_duplicate_password";
  } else {
    str = null;
  }
  return str;
}

String? validateIsEmpty(String value) {
  String? str;
  if (value.isEmpty) {
    str = 'value_can_t_be_empty';
  } else {
    str = null;
  }
  return str;
}


//
// String validateForUsername(String value) {
//   String str;
//   RegExp regExp = new RegExp(
//     r"\s+",
//     caseSensitive: false,
//     multiLine: false,
//   );
//   if (value.isEmpty) {
//     str = "username_can_t_be_empty";
//   } else if (regExp.hasMatch(value)) {
//     str = "invalid_username";
//   } else {
//     str = 'blank';
//   }
//   return str;
// }
//

// bool validateStructure(String value){
//   String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
//   RegExp regExp = new RegExp(pattern);
//   return regExp.hasMatch(value);
// }
//


// String validateForAccountNumber(String value) {
//   String str;
//   RegExp regExp = new RegExp(
//     r"^\d{10}(\d{2})?$",
//     caseSensitive: false,
//     multiLine: false,
//   );
//   if (value.isEmpty) {
//     str = "book_id_can_t_be_empty";
//     // } else if (value.length < 10 || value.length == 11 || value.length > 12 ) {
//     //   str = "invalid_range_book_id";
//   } else if (!regExp.hasMatch(value)) {
//     str = "invalid_book_id";
//   } else {
//     str = 'blank';
//   }
//   return str;
// }
//
//
// String validateForPinCode(String value) {
//   String str;
//   RegExp regExp = new RegExp(
//     r"^\d{6}",
//     caseSensitive: false,
//     multiLine: false,
//   );
//   if (value.isEmpty) {
//     str = "pin_code_can_t_be_empty";
//   } else if (!regExp.hasMatch(value)) {
//     str = "invalid_pin_code";
//   } else {
//     str = 'blank';
//   }
//   return str;
// }
//
// String validateForConfirmPinCode(String value) {
//   String str;
//   RegExp regExp = new RegExp(
//     r"^\d{6}",
//     caseSensitive: false,
//     multiLine: false,
//   );
//   if (value.isEmpty) {
//     str = "confirm_pin_code_can_t_be_empty";
//   } else if (!regExp.hasMatch(value)) {
//     str = "invalid_confirm_pin_code";
//   } else {
//     str = 'blank';
//   }
//   return str;
// }
//
// String validateForOtp(String value) {
//   String str;
//   RegExp regExp = new RegExp(
//     r"^\d{4,}",
//     caseSensitive: false,
//     multiLine: false,
//   );
//   if (value.isEmpty) {
//     str = "otp_can_t_be_empty";
//   } else if (!regExp.hasMatch(value)) {
//     str = "invalid_otp";
//   } else {
//     str = 'blank';
//   }
//   return str;
// }
//
// String? validateCommonAmount(String? value) {
//   print('value = $value');
//   String str;
//   RegExp regExp = new RegExp(
//     r"^[0-9]+(\.\d{1,2})?$",
//     caseSensitive: false,
//     multiLine: false,
//   );
//   if (value!.isEmpty) {
//     str = "withdraw_amount_can_t_be_empty";
//   } else if (!regExp.hasMatch(value)) {
//     str = "invalid_withdraw_amount";
//   } else {
//     str = 'blank';
//   }
//   return str;
// }