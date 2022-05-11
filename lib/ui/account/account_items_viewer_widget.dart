import 'package:flutter/material.dart';
import '../../utils/tools/logging.dart';
import '../../widgets/ioaon/card_widget.dart';

class AccountItemViewerWidget<T> extends StatefulWidget {

  final List<T> list;
  final List<DataColumn> tableHeader;

  const AccountItemViewerWidget({
    Key? key,
    required this.list,
    required this.tableHeader}) : super(key: key);

  @override
  State<AccountItemViewerWidget> createState() => _AccountItemViewerWidgetState();
}

class _AccountItemViewerWidgetState extends State<AccountItemViewerWidget> {

  final log = logger(AccountItemViewerWidget);

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    log.w('didChangeDependencies()');
    log.w('list length = ${widget.list.length}');

  }

  @override
  Widget build(BuildContext context) {

    return Material(
      child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CardWidget(
                  title: "Account item list",
                  child: _buildChildBody(),
                  isEnabledForm: true,
                )
              )
    );
  }

  Widget _buildChildBody() {
    return DataTable(
          columnSpacing: 0,
          columns: widget.tableHeader,
          rows: <DataRow>[
            ...widget.list.map((e) =>
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('a')),
                    DataCell(Text('b')),
                    DataCell(Text('c')),
                    DataCell(Text('d')),
                  ],
                )
            ).toList(),
          ],
        );
  }

}
