class SessionHelper {
  static final SessionHelper session = SessionHelper._internal();

  String token = "";

  SessionHelper._internal();

  factory SessionHelper() {
    return session;
  }
}
