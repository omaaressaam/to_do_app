import 'package:flutter/widgets.dart';
import 'package:to_do_app/core/models/task.dart';
import 'package:to_do_app/features/schedule/widgets/taskItem.dart';
import '../../../core/blocs/cubit/tasks_cubit.dart';

class TaskList extends StatefulWidget {
  List<Task> filterlist;
  TaskList({Key? key, required this.filterlist}) : super(key: key);

  
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.filterlist.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: TaskItem(myTask: widget.filterlist[index]),
          );
        }));
  }
}
