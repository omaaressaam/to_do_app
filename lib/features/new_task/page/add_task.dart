import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/services/notificationservice.dart';
import 'package:to_do_app/core/widgets/myButton.dart';
import 'package:to_do_app/features/new_task/widgets/colors.dart';
import 'package:to_do_app/features/new_task/widgets/date.dart';
import 'package:to_do_app/features/new_task/widgets/endDate.dart';
import 'package:to_do_app/features/new_task/widgets/remind.dart';
import 'package:to_do_app/features/new_task/widgets/repeat.dart';
import 'package:to_do_app/features/new_task/widgets/startDate.dart';
import 'package:to_do_app/features/new_task/widgets/title.dart';

import '../../../core/blocs/cubit/tasks_cubit.dart';
import '../../../core/blocs/cubit/tasks_state.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  int checkDate(int id, String title, String body, DateTime date,
      DateTime start, DateTime end) {
    String remindd = Tasksbloc.get(context).remind.text;

    if (start.isAfter(end)) {
      return 2;
    } else if (Tasksbloc.get(context).repeat.text == 'Once') {
      if (remindd == '1 day before') {
        if (DateTime(date.year, date.month, date.day, start.hour, start.minute)
            .subtract(const Duration(days: 1))
            .isBefore(DateTime.now())) {
          return 1;
        } else {
          NotificationService().showNotification(
              id,
              title,
              'Start time : ${Tasksbloc.get(context).starttimeinput.text}',
              DateTime(
                      date.year, date.month, date.day, start.hour, start.minute)
                  .subtract(const Duration(days: 1)));
          return 0;
        }
      }
      if (remindd == '1 hour before') {
        if (DateTime(date.year, date.month, date.day, start.hour, start.minute)
            .subtract(const Duration(hours: 1))
            .isBefore(DateTime.now())) {
          return 1;
        } else {
          NotificationService().showNotification(
              id,
              title,
              'Start time : ${Tasksbloc.get(context).starttimeinput.text}',
              DateTime(
                      date.year, date.month, date.day, start.hour, start.minute)
                  .subtract(const Duration(hours: 1)));
          return 0;
        }
      }
      if (remindd == '30 min before') {
        if (DateTime(date.year, date.month, date.day, start.hour, start.minute)
            .subtract(const Duration(minutes: 30))
            .isBefore(DateTime.now())) {
          return 1;
        } else {
          NotificationService().showNotification(
              id,
              title,
              'Start time : ${Tasksbloc.get(context).starttimeinput.text}',
              DateTime(
                      date.year, date.month, date.day, start.hour, start.minute)
                  .subtract(const Duration(minutes: 30)));
          return 0;
        }
      }
      if (remindd == '10 min before') {
        if (DateTime(date.year, date.month, date.day, start.hour, start.minute)
            .subtract(const Duration(minutes: 10))
            .isBefore(DateTime.now())) {
          return 1;
        } else {
          NotificationService().showNotification(
              id,
              title,
              'Start time : ${Tasksbloc.get(context).starttimeinput.text}',
              DateTime(
                      date.year, date.month, date.day, start.hour, start.minute)
                  .subtract(const Duration(minutes: 10)));
          return 0;
        }
      }
    } else if (Tasksbloc.get(context).repeat.text == 'Daily') {
      NotificationService().showdailyNotification(
          id,
          title,
          'Start time : ${Tasksbloc.get(context).starttimeinput.text}',
          remindd == '1 day before'
              ? DateTime(
                      date.year, date.month, date.day, start.hour, start.minute)
                  .subtract(const Duration(days: 1))
              : remindd == '1 hour before'
                  ? DateTime(date.year, date.month, date.day, start.hour,
                          start.minute)
                      .subtract(const Duration(hours: 1))
                  : remindd == '30 min before'
                      ? DateTime(date.year, date.month, date.day, start.hour,
                              start.minute)
                          .subtract(const Duration(minutes: 30))
                      : DateTime(date.year, date.month, date.day, start.hour,
                              start.minute)
                          .subtract(const Duration(minutes: 10)));
      return 0;
    }
    print('none');
    return 3;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Tasksbloc, TasksState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: const Text('Add Task'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Tasksbloc.get(context).dateinput.clear();
                Tasksbloc.get(context).endtimeinput.clear();
                Tasksbloc.get(context).starttimeinput.clear();
                Tasksbloc.get(context).titleinput.clear();
                Tasksbloc.get(context).repeat.clear();
                Tasksbloc.get(context).remind.clear();
                Tasksbloc.get(context).color.clear();
                Navigator.of(context).pop();
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 10),
                Divider(
                  color: Theme.of(context).inputDecorationTheme.fillColor,
                  height: 3,
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Tilte',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TaskTitle(titleinput: Tasksbloc.get(context).titleinput),
                      const SizedBox(
                        height: 17,
                      ),
                      const Text(
                        'Date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Date(dateinput: Tasksbloc.get(context).dateinput),
                      const SizedBox(
                        height: 17,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Start Time',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: StartDate(
                                    starttimeinput:
                                        Tasksbloc.get(context).starttimeinput),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'End Time',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: EndDate(
                                    endtimeinput:
                                        Tasksbloc.get(context).endtimeinput),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      const Text(
                        'Remind',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Remind(
                          reminddropdownvalue: Tasksbloc.get(context).remind),
                      const SizedBox(
                        height: 17,
                      ),
                      const Text(
                        'Repeat',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Repeat(repeat: Tasksbloc.get(context).repeat),
                      const SizedBox(
                        height: 17,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Color',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TaskColor(
                                tskcolor: Tasksbloc.get(context).color),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      MyButton(
                          onpress: () {
                            if (Tasksbloc.get(context).dateinput.text == '' ||
                                Tasksbloc.get(context).titleinput.text == '' ||
                                Tasksbloc.get(context).starttimeinput.text ==
                                    '' ||
                                Tasksbloc.get(context).endtimeinput.text ==
                                    '') {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text('Task'),
                                  content:
                                      const Text("Please fill all task data."),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(14),
                                        child: const Text("okay"),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              int j = UniqueKey().hashCode;
                              int i = checkDate(
                                  j,
                                  Tasksbloc.get(context).titleinput.text,
                                  Tasksbloc.get(context).starttimeinput.text,
                                  DateFormat('yyyy-MM-dd').parse(
                                      Tasksbloc.get(context).dateinput.text),
                                  DateFormat('kk:mm')
                                      .parse(Tasksbloc.get(context)
                                          .starttimeinput
                                          .text)
                                      .add(const Duration(hours: 1)),
                                  DateFormat('kk:mm')
                                      .parse(Tasksbloc.get(context)
                                          .endtimeinput
                                          .text)
                                      .add(const Duration(hours: 1)));

                              if (i == 0) {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: const Text('Task'),
                                    content:
                                        const Text("Task added successfully ✅"),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                          Tasksbloc.get(context).id = j;
                                          Tasksbloc.get(context).insertTask();
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(14),
                                          child: const Text("okay"),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else if (i == 1) {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: const Text('Task'),
                                    content: const Text(
                                        "This reminder time is before the present time"),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(14),
                                          child: const Text("okay"),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else if (i == 2) {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: const Text('Task'),
                                    content: const Text(
                                        "Start time must be before end time."),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(14),
                                          child: const Text("okay"),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }
                          },
                          txt: 'Create Task'),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
