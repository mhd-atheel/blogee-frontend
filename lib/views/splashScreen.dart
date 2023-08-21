import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:technical/views/authScreen.dart';
import 'package:technical/views/bottomRouteNavigation.dart';
import 'package:technical/views/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future <void>isLogin() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString('id') == null){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const AuthScreen()));
    }else{
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const  BottomRouteNavigation()));
    }

  }
  @override
  void initState() {

    Future.delayed(const Duration(seconds: 5)).whenComplete(() => isLogin()
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Center(
          child: Image.asset('assets/images/profile.png',height: 150,),
        ),
      ),
    );
  }
}
