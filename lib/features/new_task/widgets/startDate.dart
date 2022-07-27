import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StartDate extends StatefulWidget {
  TextEditingController starttimeinput;
  StartDate({Key? key, required this.starttimeinput}) : super(key: key);

  @override
  State<StartDate> createState() => _StartDateState();
}

class _StartDateState extends State<StartDate> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.starttimeinput, //editing controller of this TextField
      decoration: InputDecoration(
          suffixIcon: const Icon(Icons.timer), //icon of text field
          labelText: DateFormat.Hm().format(DateTime.now()).toString()),

      readOnly: true, //set it true, so that user will not able to edit text
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
        );

    
        DateTime parsedTime =
            // ignore: use_build_context_synchronously
            DateFormat("hh:mm a").parse(pickedTime!.format(context).toString());

        String formattedTime = DateFormat.Hm().format(parsedTime);
        setState(() {
          widget.starttimeinput.text = formattedTime;
        });
      },
    );
  }
}
