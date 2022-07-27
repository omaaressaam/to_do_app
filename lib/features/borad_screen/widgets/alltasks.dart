import 'package:flutter/material.dart';
import 'package:to_do_app/features/borad_screen/widgets/taskitem.dart';
import '../../../core/blocs/cubit/tasks_cubit.dart';

class allTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (c, i) => taskitem(
          task: Tasksbloc.get(context).mytasklist[i],
          mycolor: Color(int.parse(Tasksbloc.get(context).mytasklist[i].color))
              .withOpacity(1)),
      itemCount: Tasksbloc.get(context).mytasklist.length,
    );
  }
}
