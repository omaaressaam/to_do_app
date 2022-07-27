import 'package:flutter/material.dart';
import 'package:to_do_app/core/models/task.dart';
import 'package:to_do_app/core/services/notificationservice.dart';

import '../../../core/blocs/cubit/tasks_cubit.dart';

class taskitem extends StatelessWidget {
  Task task;
  Color mycolor;
  taskitem({Key? key, required this.task, required this.mycolor})
      : super(key: key);

  late BuildContext cxt;
  var myMenuItemsfav = <String>[
    'Mark as Completed',
    'Add to Favorite',
    'Delete'
  ];

  var myMenuItemsunfav = <String>['Mark as Completed', 'Unfavorite', 'Delete'];

  void onSelect(item) {
    switch (item) {
      case 'Add to Favorite':
        task.isFavorite = 1;
        Tasksbloc.get(cxt).updateTask(task.id, true, 1);
        break;
      case 'Mark as Completed':
        Tasksbloc.get(cxt).updateTask(task.id, false, 1);
        task.isCompleted = 1;
        break;
      case 'Unfavorite':
        Tasksbloc.get(cxt).updateTask(task.id, true, 0);
        task.isFavorite = 0;
        break;
      case 'Delete':
        NotificationService().cancelNotification(task.id);
        Tasksbloc.get(cxt).deleteTask(task.id);
        task.isFavorite = 0;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    cxt = context;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: Row(
          children: [
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  color: task.isCompleted == 1 ? mycolor : Colors.white,
                  border: Border.all(color: mycolor),
                  borderRadius: BorderRadius.circular(10)),
              child: Checkbox(
                side: BorderSide.none,
                checkColor: Colors.white,
                activeColor: task.isCompleted == 1
                    ? mycolor
                    : Colors.white /*Color(task.color)*/,
                value: task.isCompleted == 1 ? true : false,
                onChanged: (bool? value) {},
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              task.title,
              style: const TextStyle(fontSize: 16),
            ),
            const Expanded(
              child: SizedBox(width: 500),
            ),
            PopupMenuButton<String>(
                onSelected: onSelect,
                itemBuilder: (BuildContext context) {
                  return task.isFavorite == 0
                      ? myMenuItemsfav.map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(choice),
                          );
                        }).toList()
                      : myMenuItemsunfav.map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(choice),
                          );
                        }).toList();
                }),
          ],
        ),
      ),
    );
  }
}
