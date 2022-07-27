import 'package:flutter/material.dart';
import 'package:to_do_app/core/models/task.dart';
import 'package:to_do_app/features/borad_screen/widgets/taskitem.dart';

class listTasks extends StatelessWidget {
  @override
  List<Task> lTask;

  listTasks({Key? key, required this.lTask}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (c, i) => taskitem(
          task: lTask[i],
          mycolor: Color(int.parse(lTask[i].color)).withOpacity(1)),
      itemCount: lTask.length,
    );
  }
}
