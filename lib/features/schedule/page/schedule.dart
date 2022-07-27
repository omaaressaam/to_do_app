import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/features/schedule/widgets/taskList.dart';
import 'package:to_do_app/features/schedule/widgets/timeline.dart';

import '../../../core/blocs/cubit/tasks_cubit.dart';

class Schedule extends StatefulWidget {
  Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  DateTime _selectedValue = DateTime.now();

  void _updateDate([DateTime? value]) {
    setState(() {
      _selectedValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule'),
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Divider(
            color: Theme.of(context).inputDecorationTheme.fillColor,
            height: 3,
            thickness: 2,
          ),
          const SizedBox(height: 20),
          Timeline(selectedValue: _selectedValue, updatedate: _updateDate),
          const SizedBox(height: 20),
          Divider(
            color: Theme.of(context).inputDecorationTheme.fillColor,
            height: 3,
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Text(
                  DateFormat.EEEE().format(_selectedValue).toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const Expanded(
                    child: SizedBox(
                  width: 500,
                )),
                Text(DateFormat('dd MMM, yyyy')
                    .format(_selectedValue)
                    .toString()),
              ],
            ),
          ),
          const SizedBox(height: 1),
          Expanded(
              child: TaskList(
            filterlist: Tasksbloc.get(context)
                .mytasklist
                .where((i) =>
                    (i.date.year == _selectedValue.year &&
                        i.date.month == _selectedValue.month &&
                        i.date.day == _selectedValue.day) ||
                    i.repeat == 'Daily')
                .toList(),
          )),
        ],
      ),
    );
  }
}
