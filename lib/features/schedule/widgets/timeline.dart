import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';

class Timeline extends StatefulWidget {
  DateTime selectedValue;
  final ValueChanged<DateTime> updatedate;
  Timeline({Key? key, required this.selectedValue, required this.updatedate})
      : super(key: key);

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  final DatePickerController _controller = DatePickerController();

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now(),
      width: MediaQuery.of(context).size.width / 7.8,
      height: 80,
      controller: _controller,
      initialSelectedDate: DateTime.now(),
      selectionColor: Colors.green,
      selectedTextColor: Colors.white,
      daysCount: 365,
      onDateChange: (date) {
        setState(() {
          widget.selectedValue = date;
          widget.updatedate(date);
        });
      },
    );
  }
}
