class SubTask {
  int id;
  String name;
  String priority;
  int state = 0; // 0 = TODO, 1 = DOING, 2 = DONE

  SubTask(this.id, this.name, this.priority, this.state);

  Map<String, dynamic> toMap(int idTask) {
    return {
      'id': id,
      'name': name,
      'priority': priority,
      'state': state,
      'idTask': idTask
    };
  }
}
