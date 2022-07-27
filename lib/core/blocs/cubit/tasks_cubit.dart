import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/task.dart';
import '../../services/notificationservice.dart';
import 'tasks_state.dart';

class Tasksbloc extends Cubit<TasksState> {
  static Tasksbloc get(context) => BlocProvider.of<Tasksbloc>(context);
  Tasksbloc() : super(TasksInitial());
  late Database database;
  late String path;
  List<Map> tasks = [];
  late int id;
  TextEditingController dateinput = TextEditingController();
  TextEditingController endtimeinput = TextEditingController();
  TextEditingController starttimeinput = TextEditingController();
  TextEditingController titleinput = TextEditingController();
  TextEditingController repeat = TextEditingController();
  TextEditingController remind = TextEditingController();
  TextEditingController color = TextEditingController();
  List<Task> mytasklist = [];

  void createDatabase() async {
    var databasesPath = await getDatabasesPath();
    path = join(databasesPath, 'tasksskkkkkk.db');

    databaseOpen();
    emit(AppGetDatabasesPath());
  }

  void databaseOpen() async {
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) {
      db.execute(
          'CREATE TABLE Taskskkkkkk (id INTEGER PRIMARY KEY, title TEXT, date TEXT, starttime TEXT , endtime TEXT , remind TEXT ,repeat TEXT, color TEXT, isCompleted INTEGER ,isFavorite  INTEGER)');
      emit(AppCreateDatabase());
      print('table created');
    }, onOpen: (Database db) {
      emit(AppOpenDatabase());
      print('table opend');
    });

    refreshh();
  }

  void insertTask() {
    database.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO Taskskkkkkk (id , title, date, starttime , endtime , remind , repeat , color ,isCompleted , isFavorite) VALUES(?, ?, ?, ?, ?, ?, ?,?, ?, ?)',
          [
            id,
            titleinput.text,
            dateinput.text,
            starttimeinput.text,
            endtimeinput.text,
            remind.text,
            repeat.text,
            color.text,
            0,
            0
          ]).then((value) {
        emit(AppiInsertTask());
      });
    });
    refreshh();
    emit(AppLoadDatabase());
  }

  void getTask() async {
    emit(AppLoadDatabase());
    mytasklist.clear();
    await database.rawQuery('SELECT * FROM Taskskkkkkk').then((value) {
      tasks = value;
      value.forEach((tsk) => mytasklist.add(Task(
          id: int.parse(tsk['id'].toString()),
          title: tsk['title'].toString(),
          date: DateFormat('yyyy-MM-dd').parse(tsk['date'].toString()),
          startTime: DateFormat('kk:mm').parse(tsk['starttime'].toString()),
          endTime: DateFormat('kk:mm').parse(tsk['endtime'].toString()),
          remindBefore: tsk['remind'].toString(),
          repeat: tsk['repeat'].toString(),
          color: tsk['color'].toString(),
          isCompleted: int.parse(tsk['isCompleted'].toString()),
          isFavorite: int.parse(tsk['isFavorite'].toString()))));
      emit(AppGetTasks());
    });
    dateinput.clear();
    endtimeinput.clear();
    starttimeinput.clear();
    titleinput.clear();
    repeat.clear();
    remind.clear();
    color.clear();
  }

  void updateTask(int id, bool favOrComp, int boolen) async {
    if (favOrComp) {
      await database.rawUpdate(
          'UPDATE Taskskkkkkk SET isFavorite = ? WHERE id = ?', [boolen, id]);
    } else {
      await database.rawUpdate(
          'UPDATE Taskskkkkkk SET isCompleted = ? WHERE id = ?', [boolen, id]);
    }
    getTask();
  }

  void deleteTask(int id) async {
    print(id);
    await database.rawDelete('DELETE FROM Taskskkkkkk WHERE id = ?', [id]);
    getTask();
  }

  void refreshh() async {
    getTask();
  }
}
