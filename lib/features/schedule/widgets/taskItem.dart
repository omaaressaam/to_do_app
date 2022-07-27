import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/models/task.dart';

// ignore: must_be_immutable
class TaskItem extends StatelessWidget {
  Task myTask;
  TaskItem({Key? key, required this.myTask}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // <= No more error here :)
        color: Color(int.parse(myTask.color)).withOpacity(1),
      ),
      child: Row(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DateFormat('hh:mm a').format(myTask.startTime),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(
              height: 2,
            ),
            Text(
              myTask.title,
              style: const TextStyle(color: Colors.white, fontSize: 17),
            )
          ],
        ),
        const Expanded(child: SizedBox(width: 500)),
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(20)),
          child: Transform.scale(
            scale: 1.5,
            child: Checkbox(
              side: BorderSide.none,
              checkColor: Colors.white,
              activeColor: Colors.transparent,
              value: myTask.isCompleted == 1 ? true : false,
              onChanged: (bool? value) {},
            ),
          ),
        )
      ]),
    );
  }
}
