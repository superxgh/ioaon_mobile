import 'dart:developer';
import 'package:flutter/material.dart';
import 'dropdown_list_from_field.dart';

class DropdownWidget<T> extends StatelessWidget {

  final List<T> list;
  final String? label;
  final void Function(T item)? onChanged;
  final Future<void> Function(String)? onEmptyActionPressed;

  const DropdownWidget({
    Key? key,
    required this.list,
    this.label, this.onChanged,
    this.onEmptyActionPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return DropdownFormField<T>(
      onEmptyActionPressed: (str) async {
        onEmptyActionPressed!(str);
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.arrow_drop_down),
          labelText: label ?? ''),
      onSaved: (dynamic str) { },
      onChanged: onChanged ?? (dynamic str) {},
      validator: (dynamic str) {},
      displayItemFn: (dynamic item) => Text(
        (item ?? {})['name'] ?? '',
        style: TextStyle(fontSize: 16),
      ),
      findFn: (dynamic str) async {
        return list;
      },
      selectedFn: (dynamic item1, dynamic item2) {
        log('item1 = $item1, item2 = $item2');
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
