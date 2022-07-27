import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Date extends StatefulWidget {
  TextEditingController dateinput;
  Date({Key? key, required this.dateinput}) : super(key: key);

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.dateinput,
      decoration: InputDecoration(
          suffixIcon: const Icon(Icons.calendar_today),
          labelText:
              DateFormat('yyyy-MM-dd').format(DateTime.now()).toString()),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101));

        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate!);

        setState(() {
          widget.dateinput.text = formattedDate; //set output date to TextField value.
        });
      },
    );
  }
}
