import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:ioaon_mobile/constants/ioaon_global.dart';
import 'package:ioaon_mobile/stores/accounting/accounting_store.dart';
import 'package:ioaon_mobile/stores/theme/theme_store.dart';
import 'package:provider/provider.dart';
import '../../stores/accounting/accounting_form.dart';
import '../../utils/locale/app_localization.dart';
import '../../utils/routes/routes.dart';
import '../../widgets/ioaon/card_widget.dart';
import '../../widgets/ioaon/dropdown_widget.dart';
import '../../widgets/ioaon/text_input_widget.dart';
import '../layout/app_layout.dart';

class AccountingPersonalScreen extends StatefulWidget {

  const AccountingPersonalScreen({Key? key}) : super(key: key);

  @override
  State<AccountingPersonalScreen> createState() => _AccountingPersonalScreenState();
}

class _AccountingPersonalScreenState extends State<AccountingPersonalScreen> {

  late AccountingStore _accountingStore;
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
    _accountingStore = Provider.of<AccountingStore>(context);
    _themeStore = Provider.of<ThemeStore>(context);

  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
        route: Routes.accountingMenu,
        title: AppLocalizations.of(context).translate('accounting_personal_label'),
        storeList: [_accountingStore],
        body: _buildBody()
    );
  }


  Widget _buildBody() {
    return  Column(
      children: [
        _buildInputForm(),
        _buildAccountingList()
      ],
    );
  }

  Widget _buildInputForm() {
    return CardWidget(
      child: Column(
        children: [
          _buildAccountingType(),
          _buildAccountingAmount()
        ],
      ),
    );
  }

  Widget _buildAccountingType() {
    return DropdownWidget(
      label: 'Access',
      list: accountingType,
      onChanged: (dynamic data) {
        log('data = $data', name: '_buildAccountingType');
        _formStore.setAccountingType(data['name']);
      },
    );
  }


  Widget _buildAccountingAmount() {
    return TextInputWidget(
        hint: AppLocalizations.of(context).translate('accounting_personal_acc_amount'),
        inputType: TextInputType.number,
        icon: Icons.attach_money,
        isDarkMode: _themeStore.darkMode,
        textController: _accAmountController,
        inputAction: TextInputAction.next,
        onChanged: (data) {
          log('data = $data', name: '_buildAccountingAmount');
          _formStore.setAccountingAmount(double.parse(data));
        },
        onFieldSubmitted: (value) {
          // FocusScope.of(context).requestFocus(_passwordFocusNode);
        },
        errorText: ''); //_store.formErrorStore.userEmail);
  }


  Widget _buildAccountingList() {
    return Container(
      child: Text('Accounting List'),
    );
  }
}
