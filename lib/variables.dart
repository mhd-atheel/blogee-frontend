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
    static const baseUserUri = 'https://blogee-app.onrender.com/api/users/';
    static const basePostUri = 'https://blogee-app.onrender.com/api/posts/';
    static const baseLikeUri = 'https://blogee-app.onrender.com/api/likes/';

    //User end points
    static const getUsers = 'get-user';
    static const loginUser = 'login-user';
    static const signUpUser = 'create-user';
    static const getPost = 'get-post';
    static const getPostByUserId = 'get-post-by-user';
    static const createPost = 'create-post';
    static const createLike = 'create-like';
    static const deleteLike = 'delete-like';


}