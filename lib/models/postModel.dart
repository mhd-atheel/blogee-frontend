class PostModel {
  final String? id;
  final String postname;
  final String location;
  final int? likecount;
  final int? commentcount;
  final String? userid;
  final String?username;
  final String? email;
  final String? createdAt;
  final String? userprofileimage;
  final String? postimage;

  PostModel(
      {
         this.id,
      required this.postname,
      required this.location,
       this.likecount,
       this.commentcount,
       this.userid,
       this.username,
       this.email,
       this.createdAt,
       this.userprofileimage,
       this.postimage});

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
      // 'id': id,
      'postname':postname ,
      'location':location,
      'userid': userid,
      'imageUrl': postimage,
      // 'likecount': likecount,
      // 'commentcount': commentcount,
      // 'username': username,
      // 'email':email ,
      // 'createdAt': createdAt,
      // 'userprofileimage': userprofileimage,
      // 'postimage':postimage
    };
  }
}
