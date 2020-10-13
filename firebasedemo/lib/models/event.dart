class Event {
  String id;
  String description;
  String date;
  String startTime;
  String endTime;
  String speaker;
  bool isFavourite;

  Event(this.id, this.description, this.date, this.startTime, this.endTime,
      this.speaker, this.isFavourite);

  Event.fromMap(dynamic obj) {
    //this.id = obj["id"];
    this.description = obj["description"];
    this.date = obj["date"];
    this.startTime = obj["start_time"];
    this.endTime = obj["end_time"];
    this.speaker = obj["speaker"];
    this.isFavourite = obj["is_favourite"];
  }
}
