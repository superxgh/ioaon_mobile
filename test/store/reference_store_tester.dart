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
  var getIt;
  late final ReferenceStore _referenceStore;
  late final UserStore _userStore;

  setUp(() async {

    // Set getit
    await GetIt.I.reset();
    getIt = await regisGetIt();
    _userStore = UserStore(getIt<Repository>());
    _referenceStore = ReferenceStore(getIt<Repository>());

  });

  test('SignIn user -> Should have to success', () async {
    var data = {"email": 'a@a.com', "password": '123456'};
    await _userStore.signin(data);
    expect(true, 0 < (_userStore.currentUser.authToken ?? '').length);
  });

  test('getAccountTypeList -> Should have authToken', () async {
    await _referenceStore.getAccountTypeList();
    expect(true, 0 < _referenceStore.accountTypeList.length);
  });

  test('getAccountCodeList -> Should have authToken', () async {
    await _referenceStore.getAccountCodeList();
    expect(true, 0 < _referenceStore.accountCodeList.length);
  });



}
