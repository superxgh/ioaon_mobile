import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ioaon_mobile/constants/ioaon_global.dart';
import 'package:ioaon_mobile/stores/reference/reference_store.dart';
import 'package:ioaon_mobile/stores/theme/theme_store.dart';
import 'package:ioaon_mobile/widgets/progress_indicator_widget.dart';
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
  List<Map<String, dynamic>> accountList  = [];

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
    log.w('accountCodeList = ${_referenceStore.accountCodeList}');

    // Get account data list
    // _accountStore



  }

  /*
  return Stack(
      children: <Widget>[
        if(errorStoreList != null)
          ...errorStoreList!.map((store) =>
              Observer(
                builder: (context) {
                  final log = logger(AppLayout);
                  log.i('_buildBody() store.errorStore.errorMessage = ${store.errorStore.errorMessage}');
                  return displayErrorMessage(context, store.errorStore.errorMessage);
                }
              )
          ).toList(),
        body,
      ],
    );
   */
  @override
  Widget build(BuildContext context) {
    log.i('build()');

    return AppLayout(
        route: Routes.accountMenu,
        title: AppLocalizations.of(context).translate('account_personal_label'),
        body: Stack(
          children: [
            _buildBody(),
            Observer(
              builder: (context) {
                return Visibility(
                  visible: _accountStore.isLoading,
                  child: CustomProgressIndicatorWidget(),
                );
              },
            )
          ],
        )
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


  Widget _buildAccountList() {
    log.i('_buildAccountList()');
    return Container(
      child: Text('Account List'),
    );
  }

}
