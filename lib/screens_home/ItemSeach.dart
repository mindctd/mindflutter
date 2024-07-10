import 'package:dashboard/screens_home/approve_task_page.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class ItemSearch extends StatefulWidget {
  final String? title;
  final TypeInput? inputType;
  final List<String>? dropdownList;
  final Function(String value)? callback;
  final Function(DateTime value)? callbackCalendar;
  final TextEditingController? controller;
  final String? selectedItem;
  final String? dateFormat;

  const ItemSearch(
      {this.title,
      this.inputType,
      this.dropdownList,
      this.callback,
      this.controller,
      this.selectedItem,
      this.dateFormat,
      this.callbackCalendar,
      super.key});

  @override
  State<ItemSearch> createState() => _ItemSearchState();
}

class _ItemSearchState extends State<ItemSearch> {
  final List<String> items = [
    '',
  ];
  String? selectedValue;
  DateTime? _selectedDate;
  String? dateConvert;

  Widget? itemWidget() {
    switch (widget.inputType) {
      case TypeInput.itemDropDown:
        return DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: const Text(
              "Please select",
              style: TextStyle(fontSize: 20, color: Colors.amber),
            ),
            items: ((widget.dropdownList) ?? items)
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.amber),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value: widget.selectedItem ?? selectedValue,
            onChanged: (String? value) {
              // setState(() {
              //   selectedValue = value;
              // });
              widget.callback?.call(value ?? "");
            },
            iconStyleData: const IconStyleData(
              icon: Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.keyboard_arrow_down_rounded),
              ),
              iconSize: 20,
              iconEnabledColor: Colors.amber,
              iconDisabledColor: Colors.grey,
            ),
            menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.only(right: 14, left: 14),
            ),
          ),
        );
      case TypeInput.itemTextField:
        return Container(
          padding:
              const EdgeInsets.only(right: 14, left: 14, top: 10, bottom: 10),
          child: TextFormField(
            controller: widget.controller,
            style: const TextStyle(fontSize: 20),
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              hintText: widget.title,
              helperStyle: const TextStyle(fontSize: 22, color: Colors.amber),
              labelStyle: const TextStyle(fontSize: 22, color: Colors.amber),
            ),
          ),
        );
      case TypeInput.itemCalendar:
        return GestureDetector(
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2101),
            );

            if (picked != null && picked != _selectedDate) {
              setState(() {
                _selectedDate = picked;
              });
            }
            widget.callbackCalendar?.call(picked ?? DateTime.now());
          },
          child: Container(
            padding:
                const EdgeInsets.only(right: 14, left: 14, top: 10, bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    (_selectedDate ?? widget.dateFormat).toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                // SizedBox(
                //     width: 20,
                //     height: 20,
                //     child: Assets.images.icon.icCalendar.image())
              ],
            ),
          ),
        );
      default:
        return Container(
          width: MediaQuery.of(context).size.width,
          padding:
              const EdgeInsets.only(right: 14, left: 14, top: 10, bottom: 10),
          child: const Text(
            "--",
            style: TextStyle(
              fontSize: 20,
              color: Colors.amber,
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null) ...[
            Text(
              widget.title ?? "",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
          Container(
            height: 48,
            decoration: primaryBorder(radius: 12),
            child: Center(child: itemWidget()),
          )
        ],
      ),
    );
  }
}

enum TypeInput { itemDropDown, itemTextField, itemCalendar }
