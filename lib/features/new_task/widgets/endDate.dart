import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EndDate extends StatefulWidget {
  TextEditingController endtimeinput;
  EndDate({Key? key, required this.endtimeinput}) : super(key: key);

  @override
  State<EndDate> createState() => _EndDateState();
}

class _EndDateState extends State<EndDate> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.endtimeinput, //editing controller of this TextField
      decoration: InputDecoration(
          suffixIcon: const Icon(Icons.timer), //icon of text field
          labelText: DateFormat('kk:mm')
              .format(DateTime.now().add(const Duration(hours: 1, minutes: 5)))
              .toString()),

      readOnly: true, //set it true, so that user will not able to edit text
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
        );
        DateTime parsedTime =
            // ignore: use_build_context_synchronously
            DateFormat.jm().parse(pickedTime!.format(context).toString());

        String formattedTime = DateFormat('kk:mm').format(parsedTime);
        setState(() {
          widget.endtimeinput.text = formattedTime;
        });
      },
    );
  }
}
