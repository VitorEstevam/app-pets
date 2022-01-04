
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  final void Function(DateTime _date) callback;
  const DatePicker({Key? key, required this.callback}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  TextEditingController dateinput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, preencha a data';
        }
        return null;
      },
      controller: dateinput,
      decoration: const InputDecoration(
        labelText: "Data",
        border: OutlineInputBorder(),
      ),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(DateTime.now().year + 2),
        );
        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          setState(
            () {
              dateinput.text = formattedDate;
            },
          );
          
          widget.callback(pickedDate);
        }
      },
    );
  }
}