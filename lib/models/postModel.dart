class PostModel {
  final String id;
  final String postname;
  final String location;
  final int likecount;
  final int commentcount;
  final String userid;
  final String username;
  final String email;
  final String createdAt;
  final String userprofileimage;
  final String postimage;

  PostModel(
      {
        required this.id,
      required this.postname,
      required this.location,
      required this.likecount,
      required this.commentcount,
      required this.userid,
      required this.username,
      required this.email,
      required this.createdAt,
      required this.userprofileimage,
      required this.postimage});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return  PostModel(
      id: json["_id"],
      postname: json["postname"],
      location: json["location"],
      likecount: json["likecount"],
      commentcount: json["commentcount"],
      userid: json["userid"],
      username: json["username"],
      email: json["email"],
      createdAt: json["createdAt"],
      userprofileimage: json["userprofileimage"],
      postimage: json["postimage"],

    );
  }
  Map<dynamic, dynamic> toJson() {
    return {
      'id': id,
      'postname':postname ,
      'location':location,
      'likecount': likecount,
      'commentcount': commentcount,
      'userid': userid,
      'username': username,
      'email':email ,
      'createdAt': createdAt,
      'userprofileimage': userprofileimage,
      'postimage':postimage
    };
  }
}
