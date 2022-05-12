import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ioaon_mobile/constants/ioaon_global.dart';
import 'package:loadmore/loadmore.dart';
import 'package:provider/provider.dart';
import '../../stores/account/account_store.dart';
import '../../utils/tools/logging.dart';
import '../../utils/locale/app_localization.dart';
import '../../utils/routes/routes.dart';
import '../../widgets/ioaon/load_more_widget.dart';
import '../../widgets/progress_indicator_widget.dart';
import '../layout/app_layout.dart';
import 'account_ie_input_form_widget.dart';
import 'account_items_viewer_widget.dart';

class AccountPersonalScreen extends StatefulWidget {
  const AccountPersonalScreen({Key? key}) : super(key: key);

  @override
  State<AccountPersonalScreen> createState() => _AccountPersonalScreenState();
}

class _AccountPersonalScreenState extends State<AccountPersonalScreen> {
  final log = logger(AccountPersonalScreen);
  late AccountStore _accountStore;

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    _accountStore = Provider.of<AccountStore>(context);

    await _accountStore.getAccountItemList(first: true, group: AccountGroup.Personal);
    log.w('accountItemList = ${_accountStore.accountItemList}');
  }

  @override
  Widget build(BuildContext context) {
    log.i('build()');
    return AppLayout(
        route: Routes.accountMenu,
        title: AppLocalizations.of(context).translate('account_personal_label'),
        body: Stack(
          children: [
            _buildBody(),
            // Observer(
            //   builder: (context) {
            //     return Visibility(
            //       visible: _accountStore.isLoading,
            //       child: CustomProgressIndicatorWidget(text: 'Connect to backend.',),
            //     );
            //   },
            // )
          ],
        ));
  }

  Widget _buildBody() {
    log.i('_buildBody()');
    return Container(
      //)SingleChildScrollView(
      child: Column(
        children: [
          AccountIEInputFormWidget(),
          _buildAccountItemList(),
        ],
      ),
    );
  }

  Widget _buildAccountItemList() {
    log.w('_buildAccountItemList()');

    return Observer(builder: (_) {
      log.w('_accountStore.accountItemList.length = ${_accountStore.accountItemList.length}');
      log.w('_accountStore.isLoading = ${_accountStore.isLoading}');
      log.w('_accountStore.nextPage = ${_accountStore.nextPage}');
      return LoadMoreWidget(
              loadMore: accountLoader,
              count: _accountStore.accountItemList.length,
              isLoading: _accountStore.isLoading,
              nextPage: _accountStore.nextPage,
              itemViewer: accountItemViewer);
    });
  }

  Future<void> accountLoader(bool first) async {
    log.w(">>> load");
    await _accountStore.getAccountItemList(first: first, group: AccountGroup.Personal);
  }

  Widget accountItemViewer(int index) {
    log.w(">>> itemViewer");
    return Text(
      '$index = ${_accountStore.accountItemList[index].amount.toString()}',
      style: TextStyle(fontSize: 40.0),
    );
  }


}
