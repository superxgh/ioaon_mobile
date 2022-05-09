import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:ioaon_mobile/constants/ioaon_global.dart';
import 'package:ioaon_mobile/stores/theme/theme_store.dart';
import 'package:provider/provider.dart';
import '../../stores/account/input_account_form.dart';
import '../../stores/account/account_store.dart';
import '../../utils/locale/app_localization.dart';
import '../../utils/routes/routes.dart';
import '../../widgets/ioaon/card_widget.dart';
import '../../widgets/ioaon/dropdown_widget.dart';
import '../../widgets/ioaon/radio_account_ie_group_widget.dart';
import '../../widgets/ioaon/text_input_widget.dart';
import '../layout/app_layout.dart';

class AccountBusinessScreen extends StatefulWidget {

  const AccountBusinessScreen({Key? key}) : super(key: key);

  @override
  State<AccountBusinessScreen> createState() => _AccountBusinessScreenState();
}

class _AccountBusinessScreenState extends State<AccountBusinessScreen> {

  late AccountStore _accountStore;
  late ThemeStore _themeStore;
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
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores
    _accountStore = Provider.of<AccountStore>(context);
    _themeStore = Provider.of<ThemeStore>(context);

  }

  @override
  Widget build(BuildContext context) {

    log('AccountPersonalScreen build');

    return AppLayout(
        route: Routes.accountMenu,
        title: AppLocalizations.of(context).translate('account_business_label'),
        body: _buildBody()
    );
  }


  Widget _buildBody() {
    return  Column(
      children: [
        _buildInputForm(),
        _buildAccountList()
      ],
    );
  }

  Widget _buildInputForm() {
    return CardWidget(
      onOkPressed: () {  },
      child: Column(
        children: [
          _buildAccountGroup(),
          _buildAccountType(),
          _buildAccountAmount()
        ],
      ),
    );
  }

  Widget _buildAccountGroup() {
    return Container();
    //   RadioDisplayWidget(
    //   initValue: AccountIEType.Income,
    //   onChange: (String value) {
    //     log('value = $value', name: '_buildAccountGroup');
    //   },
    // );
  }

  Widget _buildAccountType() {
    return DropdownWidget(
      label: 'Access',
      list: accountList,
      onChanged: (dynamic data) {
        log('onChanged data = $data', name: '_buildAccountType');
        _formStore.setAccountType(data['name']);
      },
      onEmptyActionPressed: (str) async {
        log('onEmptyActionPressed Create new _buildAccountType str = $str');
      },
    );
  }


  Widget _buildAccountAmount() {
    return TextInputWidget(
        hint: AppLocalizations.of(context).translate('account_business_acc_amount'),
        inputType: TextInputType.number,
        icon: Icons.attach_money,
        isDarkMode: _themeStore.darkMode,
        textController: _accAmountController,
        inputAction: TextInputAction.next,
        onChanged: (data) {
          log('data = $data', name: '_buildAccountAmount');
          _formStore.setAccountAmount(double.parse(data));
        },
        onFieldSubmitted: (value) {
          // FocusScope.of(context).requestFocus(_passwordFocusNode);
        },
        errorText: ''); //_store.formErrorStore.userEmail);
  }


  Widget _buildAccountList() {
    return Container(
      child: Text('Account List'),
    );
  }

}
