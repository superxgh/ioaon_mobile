import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:ioaon_mobile/constants/ioaon_global.dart';
import 'package:ioaon_mobile/stores/theme/theme_store.dart';
import 'package:provider/provider.dart';
import '../../stores/account/account_form.dart';
import '../../stores/account/account_store.dart';
import '../../utils/locale/app_localization.dart';
import '../../utils/routes/routes.dart';
import '../../widgets/ioaon/card_widget.dart';
import '../../widgets/ioaon/dropdown_widget.dart';
import '../../widgets/ioaon/radio_account_ie_group_widget.dart';
import '../../widgets/ioaon/text_input_widget.dart';
import '../layout/app_layout.dart';

class AccountFamilyScreen extends StatefulWidget {

  const AccountFamilyScreen({Key? key}) : super(key: key);

  @override
  State<AccountFamilyScreen> createState() => _AccountFamilyScreenState();
}

class _AccountFamilyScreenState extends State<AccountFamilyScreen> {

  late AccountStore _accountStore;
  late ThemeStore _themeStore;
  TextEditingController _accAmountController = TextEditingController();
  FormStore _formStore = FormStore();

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
        title: AppLocalizations.of(context).translate('account_family_label'),
        storeList: [_accountStore],
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
    return RadioAccountIEGroupWidget(
      initValue: AccountIEGroup.Income,
      onChange: (String value) {
        log('value = $value', name: '_buildAccountGroup');
      },
    );
  }

  Widget _buildAccountType() {
    return DropdownWidget(
      label: 'Access',
      list: accountType,
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
        hint: AppLocalizations.of(context).translate('account_family_acc_amount'),
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
