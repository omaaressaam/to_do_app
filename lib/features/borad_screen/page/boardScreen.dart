import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/widgets/myButton.dart';
import 'package:to_do_app/features/borad_screen/widgets/alltasks.dart';
import 'package:to_do_app/features/borad_screen/widgets/listtasks.dart';
import 'package:to_do_app/features/new_task/page/add_task.dart';
import 'package:to_do_app/features/schedule/page/schedule.dart';

import '../../../core/blocs/cubit/tasks_cubit.dart';
import '../../../core/blocs/cubit/tasks_state.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Tasksbloc, TasksState>(
        listener: (context, state) {},
        builder: (context, state) {
          return DefaultTabController(
            initialIndex: 0,
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Board'),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.date_range),
                    color: Colors.grey,
                    tooltip: 'Schedule',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Schedule()),
                      );
                    },
                  ),
                ],
                bottom: const TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.black,
                  tabs: <Widget>[
                    Tab(child: Text('All')),
                    Tab(child: Text('Completed')),
                    Tab(child: Text('Uncompleted')),
                    Tab(child: Text('Favorite')),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Divider(
                    height: 2,
                    thickness: 2,
                    color: Theme.of(context).inputDecorationTheme.fillColor,
                  ),
                  Expanded(
                    // ignore: prefer_const_constructors
                    child: TabBarView(children: <Widget>[
                      allTasks(),
                      listTasks(
                          lTask: Tasksbloc.get(context)
                              .mytasklist
                              .where((i) => i.isCompleted == 1)
                              .toList()),
                      listTasks(
                          lTask: Tasksbloc.get(context)
                              .mytasklist
                              .where((i) => i.isCompleted == 0)
                              .toList()),
                      listTasks(
                          lTask: Tasksbloc.get(context)
                              .mytasklist
                              .where((i) => i.isFavorite == 1)
                              .toList()),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: MyButton(
                        onpress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddTask()),
                          );
                        },
                        txt: 'Add Task'),
                  )
                ],
              ),
            ),
          );
        });
  }
}
