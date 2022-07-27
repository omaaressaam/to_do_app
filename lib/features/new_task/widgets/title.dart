import 'package:flutter/material.dart';

class TaskTitle extends StatelessWidget {
  TextEditingController titleinput;
  TaskTitle({Key? key, required this.titleinput}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: titleinput,
      decoration: const InputDecoration(labelText: 'Eg. Design team meeting'),
    );
  }
}
