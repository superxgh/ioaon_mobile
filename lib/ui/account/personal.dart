import 'package:flutter/material.dart';
import 'package:ioaon_mobile/constants/ioaon_global.dart';
import 'package:ioaon_mobile/stores/reference/reference_store.dart';
import 'package:ioaon_mobile/stores/theme/theme_store.dart';
import 'package:provider/provider.dart';
import '../../models/reference/account_type.dart';
import '../../stores/user/user_store.dart';
import '../../utils/tools/logging.dart';
import '../../stores/account/input_account_form.dart';
import '../../stores/account/account_store.dart';
import '../../utils/errors/error_tools.dart';
import '../../utils/locale/app_localization.dart';
import '../../utils/routes/routes.dart';
import '../../widgets/ioaon/card_widget.dart';
import '../../widgets/ioaon/dropdown_widget.dart';
import '../../widgets/ioaon/radio_account_ie_group_widget.dart';
import '../../widgets/ioaon/text_input_widget.dart';
import '../layout/app_layout.dart';

class AccountPersonalScreen extends StatefulWidget {

  const AccountPersonalScreen({Key? key}) : super(key: key);

  @override
  State<AccountPersonalScreen> createState() => _AccountPersonalScreenState();
}

class _AccountPersonalScreenState extends State<AccountPersonalScreen> {

  final log = logger(AccountPersonalScreen);
  
  late AccountStore _accountStore;
  late ThemeStore _themeStore;
  late UserStore _userStore;
  late ReferenceStore _referenceStore;

  TextEditingController _accAmountController = TextEditingController();
  InputAccountForm _formStore = InputAccountForm();
  List<Map<String, dynamic>> accountList  = [
    {"id": 1, "name": "เงินเดือน" },
    {"id": 2, "name": "ค่ำน้ำ" },
    {"id": 3, "name": "ค่ำไฟ" },
    {"id": 4, "name": "ค่ำโทรศัพท์" },
  ];

  @override
  void initState() {
    super.initState();
    log.i('initState()');
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    log.i('didChangeDependencies()');

    // initializing stores
    _accountStore = Provider.of<AccountStore>(context);
    _themeStore = Provider.of<ThemeStore>(context);
    _userStore = Provider.of<UserStore>(context);
    _referenceStore = Provider.of<ReferenceStore>(context);

    log.w('currentUser = ${_userStore.currentUser}');

    log.w('load account type by language');
    log.w('language = ${AppLocalizations.of(context).locale}');
    log.w('accountTypeList = ${_referenceStore.accountTypeList}');



  }

  @override
  Widget build(BuildContext context) {
    log.i('build()');

    return AppLayout(
        route: Routes.accountMenu,
        title: AppLocalizations.of(context).translate('account_personal_label'),
        errorList: [_accountStore.errorStore.errorMessage],
        body: _buildBody()
    );
  }


  Widget _buildBody() {
    log.i('_buildBody()');
    return  Column(
      children: [
        _buildInputForm(),
        _buildAccountList()
      ],
    );
  }

  Widget _buildInputForm() {
    log.i('_buildInputForm()');
    return CardWidget(
      title: AppLocalizations.of(context).translate('account_input_form'),
      child: Column(
        children: [
          _buildAccountType(),
          _buildAccountCode(),
          _buildAccountAmount()
        ],
      ),
      onOkPressed: () {
        log.w('_buildInputForm() onOkPressed');
        log.w('_formStore.canSave = ${_formStore.canSave}');
        if (_formStore.canSave) {
          log.w('_formStore.data = ${_formStore.data}');

        } else {
          displayErrorMessage(context,'Please fill in all fields');
        }
      }
    );
  }

  Widget _buildAccountType() {
    log.i('_buildAccountType()');
    return RadioDisplayWidget(
      initValue: _referenceStore.accountTypeList.accountTypes!.first,
      list: _referenceStore.accountTypeList.accountTypes,
      onChange: ( value) {
        log.w('value = $value');
      },
    );
  }

  Widget _buildAccountCode() {
    log.i('_buildAccountType()');
    return DropdownWidget(
      label: AppLocalizations.of(context).translate('account_input_acc_type'),
      list: accountList,
      onChanged: (dynamic data) {
        log.w('onChanged data = $data');
        _formStore.setAccountCode(data['id']);
      },
      onEmptyActionPressed: (str) async {
        log.w('onEmptyActionPressed Create new _buildAccountType str = $str');
      },
    );
  }


  Widget _buildAccountAmount() {
    log.i('_buildAccountAmount()');
    return TextInputWidget(
        hint: AppLocalizations.of(context).translate('account_input_acc_amount'),
        inputType: TextInputType.number,
        icon: Icons.attach_money,
        isDarkMode: _themeStore.darkMode,
        textController: _accAmountController,
        inputAction: TextInputAction.next,
        onChanged: (data) {
          _formStore.setAccountAmount(double.parse('0'+data));
        },
        onFieldSubmitted: (value) {
          // FocusScope.of(context).requestFocus(_passwordFocusNode);
        },
        errorText: ''); //_store.formErrorStore.userEmail);
  }


  Widget _buildAccountList() {
    log.i('_buildAccountList()');
    return Container(
      child: Text('Account List'),
    );
  }

}
