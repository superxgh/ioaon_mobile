import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ioaon_mobile/constants/ioaon_global.dart';
import 'package:loadmore/loadmore.dart';
import 'package:provider/provider.dart';
import '../../stores/account/account_store.dart';
import '../../utils/tools/logging.dart';
import '../../utils/locale/app_localization.dart';
import '../../utils/routes/routes.dart';
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
        )
    );
  }

  Widget _buildBody() {
    log.i('_buildBody()');
    return Container( //)SingleChildScrollView(
      child: Column(
        children: [
          AccountIEInputFormWidget(),
          _buildAccountItemList(),
          // AccountItemViewerWidget(
          //     tableHeader: _accountStore.accountItemList.tableHeader,
          //     list: _accountStore.accountItemList.accountItems!
          // )
        ],
      ),
    );
  }

  Future<void> load({bool? first}) async {
    log.w(">>> load");
      await _accountStore.getAccountItemList( first: first ?? false, group: AccountGroup.Personal);
  }


  Widget _buildAccountItemList() {
    log.w('_buildAccountItemList()');

    return Observer(
        builder: (_) {
          return (_accountStore.accountItemList.length < 1 && _accountStore.isLoading)
          ? Center(child: CircularProgressIndicator())
          :Container(
              height: 400.0,
              child: RefreshIndicator(
                child: ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemCount: _accountStore.accountItemList.length,
                    itemBuilder: (_, int index) {
                      log.w('index = $index, length = ${_accountStore.accountItemList.length}, nextPage = ${_accountStore.nextPage}');
                      if ((index + 1) >= _accountStore.accountItemList.length && _accountStore.nextPage ) _loadMore();
                      if (_accountStore.isLoading)
                        return Center(child: CircularProgressIndicator());
                      else if (_accountStore.accountItemList.length > 0)
                        return Text('index = $index -> ${_accountStore.accountItemList[index].amount.toString()}',
                                  style: TextStyle(
                                      fontSize: 40.0
                                  ),
                                );
                      else
                        return Container();
                    },
                  ),
                onRefresh: _refresh,
              ),
            );
          }
        );
  }

  Future<bool> _loadMore() async {
    print("onLoadMore");
    await Future.delayed(Duration(seconds: 0, milliseconds: 100));
    load();
    return true;
  }

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    load(first: true);
  }
}