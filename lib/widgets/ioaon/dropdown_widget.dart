import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';

class DropdownWidget<T> extends StatelessWidget {

  final List<T> list;
  final String? label;
  final void Function(T item)? onChanged;

  const DropdownWidget({
    Key? key,
    required this.list,
    this.label, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownFormField<T>(
      onEmptyActionPressed: () async {},
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.arrow_drop_down),
          labelText: label ?? ''),
      onSaved: (dynamic str) {},
      onChanged: onChanged ?? (dynamic str) {},
      validator: (dynamic str) {},
      displayItemFn: (dynamic item) => Text(
        (item ?? {})['name'] ?? '',
        style: TextStyle(fontSize: 16),
      ),
      findFn: (dynamic str) async => list,
      selectedFn: (dynamic item1, dynamic item2) {
        if (item1 != null && item2 != null) {
          return item1['name'] == item2['name'];
        }
        return false;
      },
      filterFn: (dynamic item, str) =>
      item['name'].toLowerCase().indexOf(str.toLowerCase()) >= 0,
      dropdownItemFn: (dynamic item, int position, bool focused,
          bool selected, Function() onTap) =>
          ListTile(
            title: Text(item['name']),
            subtitle: Text(
              item['desc'] ?? '',
            ),
            tileColor:
            focused ? Color.fromARGB(20, 0, 0, 0) : Colors.transparent,
            onTap: onTap,
          ),
    );
  }
}
