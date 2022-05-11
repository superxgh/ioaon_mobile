import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/ioaon_global.dart';
import '../../stores/account/account_store.dart';
import '../../stores/account/input_account_form.dart';
import '../../stores/reference/reference_store.dart';
import '../../stores/theme/theme_store.dart';
import '../../utils/errors/error_tools.dart';
import '../../utils/locale/app_localization.dart';
import '../../utils/tools/logging.dart';
import '../../widgets/ioaon/card_widget.dart';
import '../../widgets/ioaon/dropdown_widget.dart';
import '../../widgets/ioaon/radio_account_ie_group_widget.dart';
import '../../widgets/ioaon/text_input_widget.dart';

class AccountIEInputFormWidget extends StatefulWidget {
  const AccountIEInputFormWidget({Key? key}) : super(key: key);

  @override
  State<AccountIEInputFormWidget> createState() => _AccountIEInputFormWidgetState();
}

class _AccountIEInputFormWidgetState extends State<AccountIEInputFormWidget> {

  InputIEAccountForm _formStore = InputIEAccountForm();
  final log = logger(AccountIEInputFormWidget);
  late AccountStore _accountStore;
  late ReferenceStore _referenceStore;
  late ThemeStore _themeStore;
  TextEditingController _accAmountController = TextEditingController();

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    log.i('didChangeDependencies()');

    // initializing stores
    _accountStore = Provider.of<AccountStore>(context);
    _referenceStore = Provider.of<ReferenceStore>(context);
    _themeStore = Provider.of<ThemeStore>(context);

  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CardWidget(
          isEnabledForm: true,
          isShowMaxMinButton: true,
          title: AppLocalizations.of(context).translate('account_input_form'),
          child: Column(
            children: [
              _buildAccountType(),
              _buildAccountCode(),
              _buildAccountAmount()
            ],
          ),
          onOkPressed: () async {
            log.w('_buildInputForm() onOkPressed');

            _formStore.validateAll();

            log.w('error hasErrorsInForm = ${_formStore.formErrorStore.hasErrorsInForm}');
            log.w('error accountType = ${_formStore.formErrorStore.accountType}');
            log.w('error accountCode = ${_formStore.formErrorStore.accountCode}');
            log.w('error accountAmount = ${_formStore.formErrorStore.accountAmount}');
            log.w('_formStore.canSave = ${_formStore.canSave}');
            log.w('_formStore.data = ${_formStore.toAccountItem}');

            if (_formStore.canSave) {
              await _accountStore.createAccountItem(AccountGroup.Personal, _formStore.toAccountItem)
                  .catchError((e) {
                log.w('e = ${e.toString()}');
                log.w('_accountStore.errorStore.errorMessage = ${_accountStore.errorStore.errorMessage}');
                displayErrorMessage(context,_accountStore.errorStore.errorMessage);
              });
            } else {
              displayErrorMessage(context,'Please fill in all fields');
            }
          }
      ),
    );
  }

  Widget _buildAccountType() {
    log.i('_buildAccountType()');
    return RadioDisplayWidget(
      // initValue: _referenceStore.accountTypeList.accountTypes!.first,
      list: _referenceStore.accountTypeList.accountTypes,
      onChange: ( dynamic data) {
        log.w('RadioDisplayWidget onChange data.id = ${data.id}');
        _formStore.setAccountType(data.id);
      },
    );
  }

  Widget _buildAccountCode() {
    log.i('_buildAccountType()');
    return DropdownWidget(
      label: AppLocalizations.of(context).translate('account_input_acc_type'),
      list: _referenceStore.accountCodeList.toDropDownList(AppLocalizations.of(context).locale.toString()),
      onChanged: (dynamic data) {
        log.w('data = $data');
        _formStore.setAccountCode(data['code']);
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



}
