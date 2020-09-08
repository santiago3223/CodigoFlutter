import 'package:controlTareas/models/subtask.dart';

class Task {
  int id;
  String name;
  String priority;
  int state = 0; // 0 = TODO, 1 = DOING, 2 = DONE
  List<SubTask> subTasks = List();

  Task(this.name, this.priority, this.state);
}
