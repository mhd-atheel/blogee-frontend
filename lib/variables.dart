import 'dart:ui';

class Variables {
    static Color blueColor = const Color(0xff0E1041);
    static Color orangeColor = const Color(0xffEBC642);

    //for android emulator =>  10.0.2.2:8000
    final String emuIp = '10.0.2.2:8000';
    //for android device =>  192.168.8.100:8000
    String phoneIp = '192.168.8.101:8000';

    final String deploy = 'https://blogee-app.onrender.com/';

    // Base user Url
    static var baseUserUri = 'https://blogee-app.onrender.com/api/users/';
    static var basePostUri = 'https://blogee-app.onrender.com/api/posts/';
    static var baseLikeUri = 'https://blogee-app.onrender.com/api/likes/';

    //User end points
    static var getUsers = 'get-user';
    static var loginUser = 'login-user';
    static var signUpUser = 'create-user';
    static var getPost = 'get-post';
    static var createPost = 'create-post';
    static var createLike = 'create-like';
    static var deleteLike = 'delete-like';


}