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
import '../../widgets/ioaon/text_input_widget.dart';
import '../layout/app_layout.dart';

class AccountPersonalScreen extends StatefulWidget {

  const AccountPersonalScreen({Key? key}) : super(key: key);

  @override
  State<AccountPersonalScreen> createState() => _AccountPersonalScreenState();
}

class _AccountPersonalScreenState extends State<AccountPersonalScreen> {

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
    return AppLayout(
        route: Routes.accountMenu,
        title: AppLocalizations.of(context).translate('account_personal_label'),
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
          _buildAccountType(),
          _buildAccountAmount()
        ],
      ),
    );
  }

  Widget _buildAccountType() {
    return DropdownWidget(
      label: 'Access',
      list: accountType,
      onChanged: (dynamic data) {
        log('data = $data', name: '_buildAccountType');
        _formStore.setAccountType(data['name']);
      },
    );
  }


  Widget _buildAccountAmount() {
    return TextInputWidget(
        hint: AppLocalizations.of(context).translate('account_personal_acc_amount'),
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
