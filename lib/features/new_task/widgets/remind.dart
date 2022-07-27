import 'package:flutter/material.dart';

class Remind extends StatefulWidget {
  TextEditingController reminddropdownvalue;
  Remind({Key? key, required this.reminddropdownvalue}) : super(key: key);

  @override
  State<Remind> createState() => _RemindState();
}

class _RemindState extends State<Remind> {
  
  var items = [
    '1 day before',
    '1 hour before',
    '30 min before',
    '10 min before'
  ];

  void initState() {
    widget.reminddropdownvalue.text = '1 day before';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return DropdownButtonFormField(
      value: '1 day before',
      icon: const Icon(Icons.keyboard_arrow_down),
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          widget.reminddropdownvalue.text = newValue!;
        });
      },
    );
  }
}
