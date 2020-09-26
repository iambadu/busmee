import 'package:flutter/material.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class DateField extends StatelessWidget {
  final String action;
  final DateTime initVal;
  final Widget rstIcon;

  DateField({@required this.action, this.rstIcon, this.initVal});
  final format = DateFormat.yMMMd();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DateTimeField(
        resetIcon: rstIcon,
        format: format,
        initialValue: initVal,
        decoration: InputDecoration(
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: action,
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.only(left: 15.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: Colors.grey[500],
              width: 1.0,
            ),
          ),
        ),
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2050));
        },
      ),
    );
  }
}
