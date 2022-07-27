class Task {
  int id;
  String title;
  DateTime date;
  DateTime startTime;
  DateTime endTime;
  String remindBefore;
  String repeat;
  String color;
  int isCompleted;
  int isFavorite;

  Task(
      {required this.id,
      required this.title,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.remindBefore,
      required this.repeat,
      required this.isCompleted,
      required this.isFavorite,
      required this.color});
}
