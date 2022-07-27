import 'package:flutter/material.dart';

class TaskColor extends StatefulWidget {
  TextEditingController tskcolor;
  TaskColor({Key? key, required this.tskcolor}) : super(key: key);

  @override
  State<TaskColor> createState() => _TaskColorState();
}

class ColorItem {
  ColorItem(this.name, this.color);
  final String name;
  final Color color;
}

class _TaskColorState extends State<TaskColor> {
  final List<ColorItem> items = [
    ColorItem("Green", Colors.green),
    ColorItem("Orange", Colors.orange),
    ColorItem("Blue", Colors.lightBlue),
  ];
  late ColorItem currentChoice;

  void initState() {
    widget.tskcolor.text = items[0].color.value.toString();
    currentChoice = items[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      value: currentChoice,
      items: items
          .map<DropdownMenuItem<ColorItem>>(
              (ColorItem item) => DropdownMenuItem<ColorItem>(
                    value: item,
                    child: Container(
                      alignment: Alignment.center,
                      constraints: const BoxConstraints(minHeight: 40.0),
                      color: item.color,
                      child: Text(item.name),
                    ),
                  ))
          .toList(),
      onChanged: (ColorItem? value) => setState(() {
        currentChoice = value!;
        widget.tskcolor.text = value.color.value.toString();
      }),
    );
  }
}
