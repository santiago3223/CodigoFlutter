class User {
  User({
    this.id,
    this.password,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.isActive,
  });

  int id;
  String password;
  String username;
  String firstName;
  String lastName;
  String email;
  bool isActive;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        password: json["password"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "password": password,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "is_active": isActive,
      };
}
