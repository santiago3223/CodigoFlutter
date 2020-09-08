class SubTask {
  int id;
  String name;
  String priority;
  int state = 0; // 0 = TODO, 1 = DOING, 2 = DONE

  SubTask(this.name, this.priority, this.state);
}
