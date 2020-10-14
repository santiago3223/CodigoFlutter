class Favourite {
  String id;
  String eventId;
  String userId;

  Favourite(this.id, this.eventId, this.userId);

  Map<String, dynamic> toMap() {
    Map map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['eventId'] = eventId;
    map['userId'] = userId;
    return map;
  }

  Favourite.fromMap(dynamic obj) {
    this.id = obj.id;
    this.eventId = obj["eventId"];
    this.userId = obj["userId"];
  }
}
