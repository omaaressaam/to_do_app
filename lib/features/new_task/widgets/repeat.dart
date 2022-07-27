import 'package:flutter/material.dart';

class Repeat extends StatefulWidget {
  TextEditingController repeat;
  Repeat({Key? key, required this.repeat}) : super(key: key);

  @override
  State<Repeat> createState() => _RepeatState();
}

class _RepeatState extends State<Repeat> {
  var items = [
    'Once',
    'Daily',
  ];

  void initState() {
    widget.repeat.text = 'Once';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: 'Once',
      icon: const Icon(Icons.keyboard_arrow_down),
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          widget.repeat.text = newValue!;
        });
      },
    );
  }
}
