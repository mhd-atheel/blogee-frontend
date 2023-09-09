class UserModel {

  String? username;
  String email;
  String? password;
  String? profileImage;

  UserModel({
    this.username,
    required this.email, this.password, this.profileImage});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return  UserModel(
      username: json["username"],
      email: json["email"],
      profileImage: json["imageUrl"],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }
}
