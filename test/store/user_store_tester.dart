import 'package:get_it/get_it.dart';
import 'package:ioaon_mobile/data/repository.dart';
import 'package:ioaon_mobile/data/sharedpref/constants/preferences.dart';
import 'package:ioaon_mobile/stores/reference/reference_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ioaon_mobile/stores/user/user_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global_function.dart';


void main() {
  // This method provided by `flutter_test` is called before each test.
  late final getIt;
  late final ReferenceStore _referenceStore;
  late final UserStore _userStore;

  setUp(() async {

    // Set shared preferences variable
    // SharedPreferences pref = await SharedPreferences.getInstance();
    // pref.setBool(Preferences.is_logged_in, true);
    // pref.setString(Preferences.auth_token, "847db030-92b3-4db7-8bf7-9206b2d37e53");


    // Set getit
    await GetIt.I.reset();
    getIt = await regisGetIt();
    _userStore = UserStore(getIt<Repository>());

  });

  test('SignUp user -> Should have to success', () async {
    var data = {
      "fullName": 'mr.b',
      "mobileNumber": '0901238001',
      "email": 'b@b.com',
      "password": "123456"
    };
    await _userStore.signup(data);
    expect(true, _userStore.success);
  });

 test('SignIn user -> Should have to success', () async {
    var data = {
      "email": 'a@a.com',
      "password": '123456'
    };
    await _userStore.signin(data);
    expect(true, 0 < (_userStore.currentUser.authToken ?? '').length);
  });

  test('Get getUserByToken -> Should have authToken', () async {
    await _userStore.initIsLoggedInAndAuthToken();
    await _userStore.getUserByToken();
    expect(true, 0 < (_userStore.currentUser.authToken ?? '').length);
  });

}

