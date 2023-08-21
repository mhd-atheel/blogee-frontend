class UserModel {

  String? username;
  String email;
  String? password;

  UserModel({
    this.username,
    required this.email, this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(
        username: json["username"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
